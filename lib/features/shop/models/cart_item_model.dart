class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  String? brandName;
  String? variationId;
  Map<String, String>? selectedVariation;
  int quantity;

  CartItemModel({
    required this.productId,
    required this.title,
    required this.price,
    this.image,
    this.brandName,
    this.variationId,
    this.selectedVariation,
    this.quantity = 1,
  });

  static CartItemModel empty() =>
      CartItemModel(productId: '', title: '', price: 0);

  /// ✅ Add this
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Title': title,
      'Price': price,
      'Image': image,
      'BrandName': brandName,
      'VariationId': variationId,
      'SelectedVariation': selectedVariation,
      'Quantity': quantity,
    };
  }

  /// ✅ Add this
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['ProductId'] ?? '',
      title: json['Title'] ?? '',
      price: double.tryParse('${json['Price'] ?? 0}') ?? 0,
      image: json['Image'],
      brandName: json['BrandName'],
      variationId: json['VariationId'],
      selectedVariation: json['SelectedVariation'] != null
          ? Map<String, String>.from(json['SelectedVariation'])
          : null,
      quantity: json['Quantity'] ?? 1,
    );
  }
}
