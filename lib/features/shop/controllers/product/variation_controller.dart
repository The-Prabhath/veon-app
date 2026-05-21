import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Map of attribute name → currently selected value
  /// e.g. {'Color': 'Red', 'Size': 'M'}
  RxMap<String, String> selectedAttributes = <String, String>{}.obs;

  /// The variation that matches all currently selected attributes
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // ─── Select an attribute value ────────────────────────────────────────────

  void onAttributeSelected(
      ProductModel product, String attributeName, String attributeValue) {
    // Update the selected map
    final selectedAttributesCopy =
        Map<String, String>.from(selectedAttributes);
    selectedAttributesCopy[attributeName] = attributeValue;
    selectedAttributes.assignAll(selectedAttributesCopy);

    // Find the matching variation
    final selectedVariationData = product.productVariations?.firstWhere(
      (variation) => _isAttributeMapEqual(
        variation.attributeValues,
        selectedAttributes,
      ),
      orElse: () => ProductVariationModel.empty(),
    );

    selectedVariation.value =
        selectedVariationData ?? ProductVariationModel.empty();
  }

  /// Reset selections for a new product
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    selectedVariation.value = ProductVariationModel.empty();
  }

  // ─── Helpers ─────────────────────────────────────────────────────────────

  /// Check if an attribute value should be shown as selected
  bool isAttributeSelected(String attributeName, String attributeValue) {
    return selectedAttributes[attributeName] == attributeValue;
  }

  /// Check if a specific combination is in stock
  bool isVariationInStock(
      ProductModel product, String attributeName, String attributeValue) {
    final testAttributes =
        Map<String, String>.from(selectedAttributes)
          ..[attributeName] = attributeValue;

    final matchingVariation = product.productVariations?.firstWhereOrNull(
      (v) => _isAttributeMapEqual(v.attributeValues, testAttributes),
    );

    if (matchingVariation == null) return false;
    return int.tryParse(matchingVariation.stock) != null &&
        int.parse(matchingVariation.stock) > 0;
  }

  /// Get the effective price for the current variation (or product default)
  String getVariationPrice() {
    if (selectedVariation.value.id.isEmpty) return '';
    final v = selectedVariation.value;
    return v.salePrice.isNotEmpty && double.tryParse(v.salePrice) != null
        ? v.salePrice
        : v.price;
  }

  /// Return a color for the chip based on stock availability
  Color getAttributeChipColor(
      BuildContext context,
      ProductModel product,
      String attributeName,
      String attributeValue) {
    final inStock =
        isVariationInStock(product, attributeName, attributeValue);
    return inStock ? Theme.of(context).colorScheme.primary : Colors.grey;
  }

  // ─── Private ─────────────────────────────────────────────────────────────

  bool _isAttributeMapEqual(
      Map<String, String> variationAttributes,
      Map<String, String> selectedAttrs) {
    if (variationAttributes.length != selectedAttrs.length) return false;
    return selectedAttrs.entries.every(
      (entry) => variationAttributes[entry.key] == entry.value,
    );
  }
}
