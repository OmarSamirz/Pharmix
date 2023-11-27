class Order {
  const Order(
    this.id,
    this.isActive,
    this.date,
    this.paymentType,
    this.isDelivered,
    this.isPrescription,
  );

  final int id;
  final bool isActive;
  final DateTime date;
  final bool paymentType;
  final bool isDelivered;
  final bool isPrescription;
}
