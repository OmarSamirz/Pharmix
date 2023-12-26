import 'package:pharmix/data/product_list.dart';
import 'package:pharmix/models/cart.dart';

var cart1 = Cart(
  totalPrice: 170,
  subTotal: 150,
  productList: productList,
  deliveryFees: 20,
);

final List<Cart>  cartList= [
  cart1,
  cart1,
  cart1,
  cart1,
];