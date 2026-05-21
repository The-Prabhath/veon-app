class ProductVariationModel {
  final String id;
  String stock;
  String price;
  String salePrice;
  String image;
  String? description;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.stock = '0',
    this.price = '0',
    this.salePrice = '0',
    this.image = '',
    this.description,
    required this.attributeValues,
  });

  /// Empty helper function
  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributeValues: {},
      );

  /// Convert model to JSON structure for Firestore
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Stock': stock,
      'Price': price,
      'SalePrice': salePrice,
      'Image': image,
      'Description': description,
      'AttributeValues': attributeValues,
    };
  }

  /// Factory constructor to create a ProductVariationModel from a JSON map
  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['Id'] ?? '',
      stock: json['Stock'] ?? '0',
      price: json['Price'] ?? '0',
      salePrice: json['SalePrice'] ?? '0',
      image: json['Image'] ?? '',
      description: json['Description'] ?? '',
      attributeValues: Map<String, String>.from(json['AttributeValues'] ?? {}),
    );
  }
}
