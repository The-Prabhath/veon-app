import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/models/product_model.dart';

class TSortableProducts extends StatefulWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  State<TSortableProducts> createState() => _TSortableProductsState();
}

class _TSortableProductsState extends State<TSortableProducts> {
  String _sortOption = 'Name';
  late List<ProductModel> _sortedProducts;

  @override
  void initState() {
    super.initState();
    _sortedProducts = List.from(widget.products);
  }

  void _onSortChanged(String? value) {
    if (value == null) return;
    setState(() {
      _sortOption = value;
      switch (value) {
        case 'Name':
          _sortedProducts.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'Higher Price':
          _sortedProducts.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'Lower Price':
          _sortedProducts.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'Sale':
          _sortedProducts.sort((a, b) {
            final aOnSale = a.isOnSale ? 1 : 0;
            final bOnSale = b.isOnSale ? 1 : 0;
            return bOnSale.compareTo(aOnSale);
          });
          break;
        case 'Newest':
          // Keep insertion order (Firestore returns newest last by default)
          _sortedProducts = List.from(widget.products.reversed);
          break;
        case 'Popularity':
          // Featured products first as a proxy for popularity
          _sortedProducts.sort((a, b) {
            final aFeat = (a.isFeatured ?? false) ? 1 : 0;
            final bFeat = (b.isFeatured ?? false) ? 1 : 0;
            return bFeat.compareTo(aFeat);
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔽 Sort Dropdown
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            border: OutlineInputBorder(),
          ),
          value: _sortOption,
          onChanged: _onSortChanged,
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),

        const SizedBox(height: 16),

        /// 🛍 Products Grid
        _sortedProducts.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: Text('No products found')),
              )
            : GridView.builder(
                itemCount: _sortedProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 288,
                ),
                itemBuilder: (_, index) => TProductCardVertical(
                  product: _sortedProducts[index],
                ),
              ),
      ],
    );
  }
}
