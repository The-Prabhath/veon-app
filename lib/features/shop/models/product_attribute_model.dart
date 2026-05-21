class ProductAttributeModel {
  String name;
  List<String>? values;

  ProductAttributeModel({
    required this.name,
    this.values,
  });

  /// Convert model to JSON structure for Firestore
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  /// Factory constructor to create a ProductAttributeModel from a JSON map
  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    return ProductAttributeModel(
      name: json['Name'] ?? '',
      values: List<String>.from(json['Values'] ?? []),
    );
  }
}
