import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final _repo = Get.put(AddressRepository());

  RxList<AddressModel> allUserAddresses = <AddressModel>[].obs;
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final isLoading = false.obs;

  // Form keys & controllers for Add New Address
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  @override
  void onInit() {
    fetchAllUserAddresses();
    super.onInit();
  }

  Future<void> fetchAllUserAddresses() async {
    try {
      isLoading.value = true;
      final addresses = await _repo.fetchUserAddresses();
      allUserAddresses.assignAll(addresses);
      // Auto-select the one marked as selected
      final sel = addresses.firstWhereOrNull((a) => a.selectedAddress);
      if (sel != null) selectedAddress.value = sel;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Tap an address card to select it
  Future<void> selectAddress(AddressModel address) async {
    try {
      // Deselect previous
      if (selectedAddress.value.id.isNotEmpty) {
        await _repo.updateSelectedAddress(selectedAddress.value.id, false);
        final prev = allUserAddresses
            .indexWhere((a) => a.id == selectedAddress.value.id);
        if (prev >= 0) allUserAddresses[prev].selectedAddress = false;
      }
      // Select new
      address.selectedAddress = true;
      await _repo.updateSelectedAddress(address.id, true);
      selectedAddress.value = address;
      allUserAddresses.refresh();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Save a new address from the form
  Future<void> addNewAddress() async {
    try {
      if (!addressFormKey.currentState!.validate()) return;

      TFullScreenLoader.openLoadingDialog(
          'Saving address...', 'assets/images/animations/loader.json');

      final newAddress = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        postalCode: postalCode.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
      );

      final id = await _repo.addAddress(newAddress);

      // Re-fetch to get updated list
      await fetchAllUserAddresses();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Address Saved', message: 'Your address has been saved.');
      _clearForm();
      Get.back();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Delete an address
  Future<void> deleteAddress(AddressModel address) async {
    try {
      await _repo.deleteAddress(address.id);
      allUserAddresses.removeWhere((a) => a.id == address.id);
      if (selectedAddress.value.id == address.id) {
        selectedAddress.value = AddressModel.empty();
      }
      TLoaders.customToast(message: 'Address removed.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void _clearForm() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
  }

  @override
  void onClose() {
    name.dispose();
    phoneNumber.dispose();
    street.dispose();
    postalCode.dispose();
    city.dispose();
    state.dispose();
    country.dispose();
    super.onClose();
  }
}
