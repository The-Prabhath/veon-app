import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// ─────────────────────────────────────────
  /// Fetch featured products (shown on home)
  /// ─────────────────────────────────────────
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ─────────────────────────────────────────
  /// Fetch all featured products (all products screen)
  /// ─────────────────────────────────────────
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ─────────────────────────────────────────
  /// Fetch products by category id
  /// ─────────────────────────────────────────
  Future<List<ProductModel>> getProductsByCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      // Products have categoryId stored directly
      QuerySnapshot<Map<String, dynamic>> productCategoryQuery;

      if (limit == -1) {
        productCategoryQuery = await _db
            .collection('Products')
            .where('CategoryId', isEqualTo: categoryId)
            .get();
      } else {
        productCategoryQuery = await _db
            .collection('Products')
            .where('CategoryId', isEqualTo: categoryId)
            .limit(limit)
            .get();
      }

      return productCategoryQuery.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ─────────────────────────────────────────
  /// Fetch products by brand id
  /// ─────────────────────────────────────────
  Future<List<ProductModel>> getProductsByBrand(
      {required String brandId, int limit = -1}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot;

      if (limit == -1) {
        snapshot = await _db
            .collection('Products')
            .where('Brand.Id', isEqualTo: brandId)
            .get();
      } else {
        snapshot = await _db
            .collection('Products')
            .where('Brand.Id', isEqualTo: brandId)
            .limit(limit)
            .get();
      }

      return snapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ─────────────────────────────────────────
  /// Fetch products by brand AND category
  /// ─────────────────────────────────────────
  Future<List<ProductModel>> getProductsByBrandAndCategory({
    required String brandId,
    required String categoryId,
  }) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('Brand.Id', isEqualTo: brandId)
          .where('CategoryId', isEqualTo: categoryId)
          .get();
      return snapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ─────────────────────────────────────────
  /// Search products by title (simple prefix search)
  /// ─────────────────────────────────────────
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('Title', isGreaterThanOrEqualTo: query)
          .where('Title', isLessThanOrEqualTo: '$query\uf8ff')
          .get();
      return snapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ─────────────────────────────────────────
  /// Fetch a single product by id
  /// ─────────────────────────────────────────
  Future<ProductModel> getProductById(String productId) async {
    try {
      final doc =
          await _db.collection('Products').doc(productId).get();
      return ProductModel.fromSnapshot(doc);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ─────────────────────────────────────────
  /// Upload dummy/seed products to Firestore
  /// ─────────────────────────────────────────
  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      final batch = _db.batch();
      for (final product in products) {
        final docRef = _db.collection('Products').doc(product.id);
        batch.set(docRef, product.toJson());
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
