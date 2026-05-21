import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      return snapshot.docs
          .map((doc) => BrandModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get featured brands (shown on store/home page)
  Future<List<BrandModel>> getFeaturedBrands() async {
    try {
      final snapshot = await _db
          .collection('Brands')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs
          .map((doc) => BrandModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get brands by category — brand IDs stored in a 'BrandCategory' join collection
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query the join collection BrandCategory
      final brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      // Extract brand IDs
      final brandIds =
          brandCategoryQuery.docs.map((doc) => doc['BrandId'] as String).toList();

      if (brandIds.isEmpty) return [];

      // Fetch each brand by id
      final brandSnapshots = await Future.wait(
        brandIds.map((id) => _db.collection('Brands').doc(id).get()),
      );

      return brandSnapshots
          .where((doc) => doc.exists)
          .map((doc) => BrandModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload brands to Firestore (useful for seeding data)
  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      final batch = _db.batch();
      for (final brand in brands) {
        final docRef = _db.collection('Brands').doc(brand.id);
        batch.set(docRef, brand.toJson());
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
