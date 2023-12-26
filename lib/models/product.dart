class Product {
  const Product({
    required this.id,
    this.image,
    required this.name,
    required this.price,
    this.oldPrice,
    this.discountAmount,
    required this.companyName,
    required this.category,
    required this.amount,
    required this.isPrescription,
    required this.isDiscount,
    required this.description,
  });

  final int id;
  final String? image;
  final String name;
  final double price;
  final double? oldPrice;
  final int? discountAmount;
  final String companyName;
  final String category;
  final String amount;
  final bool isPrescription;
  final bool isDiscount;
  final String description;
}
