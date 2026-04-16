import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Products'),
        leading: const BackButton(),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0), // TSizes.defaultSpace
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
