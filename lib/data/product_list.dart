import 'package:pharmix/models/product.dart';

var product1 = const Product(
  id: 1,
  price: 150 - 0.01,
  oldPrice: 200 - 0.01,
  discountAmount: 20,
  name: 'VEGASKINE COMPUND 5 RECTAL SUPP.',
  companyName: 'ALEXANDRIA',
  category: 'analgesic',
  amount: '60 Capsules in Bottle',
  isDiscount: true,
  description: '',
  isPrescription: false,
);

var productList = [
  product1,
  product1,
  product1,
  product1,
  product1,
];
