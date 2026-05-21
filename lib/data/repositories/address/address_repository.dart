import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  CollectionReference get _addressCol =>
      _db.collection('Users').doc(_uid).collection('Addresses');

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      if (_uid == null) return [];

      final result = await _addressCol.get();
      return result.docs
          .map((e) => AddressModel.fromSnapshot(
              e as DocumentSnapshot<Map<String, dynamic>>))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      if (_uid == null) throw 'User not logged in.';
      final ref = await _addressCol.add(address.toJson());
      return ref.id;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      if (_uid == null) return;
      await _addressCol.doc(addressId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }

  Future<void> updateSelectedAddress(String addressId, bool selected) async {
    try {
      if (_uid == null) return;
      await _addressCol.doc(addressId).update({'SelectedAddress': selected});
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }
}
