import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Fetch all active banners for a given target (e.g. 'home' or categoryId)
  Future<List<BannerModel>> fetchBanners(String target) async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .where('TargetScreen', isEqualTo: target)
          .get();
      return result.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong fetching banners.';
    }
  }
}
