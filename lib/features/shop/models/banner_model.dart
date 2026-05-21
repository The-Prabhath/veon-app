import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String imageUrl;
  final String targetScreen; // 'home' or a categoryId
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() => {
        'ImageUrl': imageUrl,
        'TargetScreen': targetScreen,
        'Active': active,
      };

  factory BannerModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? 'home',
      active: data['Active'] ?? false,
    );
  }
}
