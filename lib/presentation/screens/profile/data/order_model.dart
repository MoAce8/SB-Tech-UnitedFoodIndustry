class OrderModel {
  OrderModel({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
  });

  final String id;
  final String name;
  final double price;
  final String status;
}
