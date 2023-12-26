import 'package:pharmix/models/product.dart';

class Cart {
  Cart({required this.totalPrice,required this.subTotal,required this.productList,required this.deliveryFees,});

  final double deliveryFees;
  final double totalPrice;
  final double subTotal;
  final List<Product> productList;
}
