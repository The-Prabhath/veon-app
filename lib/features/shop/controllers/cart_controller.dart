import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart'; // ← add this

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 1.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  /// Called when opening product detail — sets quantity to existing cart qty
  void initProductQuantityInCart(ProductModel product) {
    final index = cartItems.indexWhere((i) => i.productId == product.id);
    productQuantityInCart.value = index >= 0 ? cartItems[index].quantity : 1;
  }

  void increaseQuantity(int maxStock) {
    if (productQuantityInCart.value < maxStock) {
      productQuantityInCart.value++;
    } else {
      TLoaders.warningSnackBar(
          title: 'Max Stock', message: 'Only $maxStock items available.');
    }
  }

  void decreaseQuantity() {
    if (productQuantityInCart.value > 1) productQuantityInCart.value--;
  }

  /// Add from product detail page (uses productQuantityInCart)
  void addToCart(ProductModel product) {
    if (product.stock < 1) {
      TLoaders.warningSnackBar(
          title: 'Out of Stock', message: 'This product is out of stock.');
      return;
    }
    final item = _buildCartItem(product, productQuantityInCart.value);
    _upsertItem(item);
    _updateTotals();
    TLoaders.customToast(message: 'Product added to cart.');
  }

  /// Add 1 directly from product card + button
  void addOneToCart(ProductModel product) {
    if (product.stock < 1) {
      TLoaders.warningSnackBar(
          title: 'Out of Stock', message: 'This product is out of stock.');
      return;
    }
    final item = _buildCartItem(product, 1);
    _upsertItem(item);
    _updateTotals();
    TLoaders.customToast(message: '${product.title} added to cart.');
  }

  void addOneToCartItem(CartItemModel item) {
    final index = _findIndex(item);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    _updateTotals();
  }

  void removeOneFromCartItem(CartItemModel item) {
    final index = _findIndex(item);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems.removeAt(index);
      }
      _updateTotals();
    }
  }

  void removeFromCart(CartItemModel item) {
    cartItems.removeWhere((i) => i.productId == item.productId);
    _updateTotals();
    TLoaders.customToast(message: 'Product removed from cart.');
  }

  void clearCart() {
    cartItems.clear();
    productQuantityInCart.value = 1;
    _updateTotals();
  }

  int quantityInCart(String productId) {
    final index = cartItems.indexWhere((i) => i.productId == productId);
    return index >= 0 ? cartItems[index].quantity : 0;
  }

  // ─── Private ─────────────────────────────────────────────────────────────

  CartItemModel _buildCartItem(ProductModel product, int qty) {
    final price = product.productType == ProductType.simple
        ? (product.salePriceDouble > 0
            ? product.salePriceDouble
            : product.price)
        : product.price;
    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      image: product.thumbnail,
      brandName: product.brand?.name,
      quantity: qty,
    );
  }

  void _upsertItem(CartItemModel item) {
    final index = _findIndex(item);
    if (index >= 0) {
      cartItems[index].quantity = item.quantity;
    } else {
      cartItems.add(item);
    }
  }

  int _findIndex(CartItemModel item) =>
      cartItems.indexWhere((i) => i.productId == item.productId);

  void _updateTotals() {
    double total = 0;
    int count = 0;
    for (final item in cartItems) {
      total += item.price * item.quantity;
      count += item.quantity;
    }
    totalCartPrice.value = total;
    noOfCartItems.value = count;
    cartItems.refresh();
  }
}
