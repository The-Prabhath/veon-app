import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';
import 'package:t_store/utils/constants/enums.dart';

class ProductModel {
  final String id;
  int stock;
  String? sku;
  String title;
  double price;
  String? salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  ProductType productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.images,
    this.salePrice,
    this.isFeatured,
    this.description,
    this.categoryId,
    this.productAttributes,
    this.productVariations,
  });

  /// Empty helper function
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0,
        thumbnail: '',
        productType: ProductType.simple,
      );

  /// Helper getter: returns salePrice as double, or 0 if null/empty
  double get salePriceDouble =>
      double.tryParse(salePrice ?? '') ?? 0.0;

  /// Helper getter: effective display price (salePrice if set, else price)
  double get effectivePrice =>
      salePriceDouble > 0 ? salePriceDouble : price;

  /// Helper getter: true if currently on sale
  bool get isOnSale =>
      salePriceDouble > 0 && salePriceDouble < price;

  /// Calculate discount percentage
  String? get discountPercentage {
    if (isOnSale) {
      final percent = ((price - salePriceDouble) / price * 100).round();
      return '$percent%';
    }
    return null;
  }

  /// Convert model to JSON structure for Firestore
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Stock': stock,
      'SKU': sku,
      'Price': price,
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images ?? [],
      'ProductType': productType.toString(),
      'ProductAttributes':
          productAttributes?.map((e) => e.toJson()).toList() ?? [],
      'ProductVariations':
          productVariations?.map((e) => e.toJson()).toList() ?? [],
    };
  }

  /// Factory constructor to create a ProductModel from a Firestore snapshot
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ProductModel(
        id: document.id,
        title: data['Title'] ?? '',
        stock: data['Stock'] ?? 0,
        sku: data['SKU'] ?? '',
        price: double.tryParse('${data['Price'] ?? 0}') ?? 0,
        salePrice: data['SalePrice']?.toString() ?? '',
        thumbnail: data['Thumbnail'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        brand: data['Brand'] != null
            ? BrandModel.fromJson(data['Brand'])
            : null,
        description: data['Description'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        images: data['Images'] != null
            ? List<String>.from(data['Images'])
            : [],
        productType: data['ProductType'] == ProductType.variable.toString()
            ? ProductType.variable
            : ProductType.simple,
        productAttributes: (data['ProductAttributes'] as List<dynamic>?)
                ?.map((e) =>
                    ProductAttributeModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        productVariations: (data['ProductVariations'] as List<dynamic>?)
                ?.map((e) =>
                    ProductVariationModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );
    }
    return ProductModel.empty();
  }

  /// Factory constructor to create a ProductModel from a JSON / QueryDocumentSnapshot
  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      sku: data['SKU'] ?? '',
      price: double.tryParse('${data['Price'] ?? 0}') ?? 0,
      salePrice: data['SalePrice']?.toString() ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      brand: data['Brand'] != null
          ? BrandModel.fromJson(data['Brand'] as Map<String, dynamic>)
          : null,
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null
          ? List<String>.from(data['Images'] as List)
          : [],
      productType: data['ProductType'] == ProductType.variable.toString()
          ? ProductType.variable
          : ProductType.simple,
      productAttributes: (data['ProductAttributes'] as List<dynamic>?)
              ?.map((e) =>
                  ProductAttributeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      productVariations: (data['ProductVariations'] as List<dynamic>?)
              ?.map((e) =>
                  ProductVariationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
