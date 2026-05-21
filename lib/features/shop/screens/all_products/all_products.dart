import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, this.title, this.categoryId});

  final String? title;
  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Popular Products'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder<List<ProductModel>>(
            future: categoryId != null
                ? controller.fetchProductsByCategory(categoryId: categoryId!)
                : controller.getAllFeaturedProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final products = snapshot.data ?? [];
              if (products.isEmpty) {
                return const Center(child: Text('No products found.'));
              }
              return TSortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
