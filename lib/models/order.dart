class Order {
  const Order(
    this.id,
    this.price,
    this.isActive,
    this.date,
    this.paymentType,
    this.isDelivered,
    this.isPrescription,
    this.currentTime,
    this.estimatedTime,
  );

  final int id;
  final double price;
  final bool isActive;
  final String date;
  final bool paymentType;
  final bool isDelivered;
  final bool isPrescription;
  final String currentTime;
  final String estimatedTime;
}
