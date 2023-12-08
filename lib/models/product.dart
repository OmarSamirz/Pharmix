import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.id,
    required this.price,
    this.oldPrice,
    this.discountAmount,
    required this.name,
    required this.companyName,
    required this.category,
    required this.amount,
    required this.isDiscount,
    this.image,
  });

  final int id;
  final double price;
  final double? oldPrice;
  final int? discountAmount;
  final String name;
  final String companyName;
  final String category;
  final String amount;
  final bool isDiscount;
  final Image? image;
}
