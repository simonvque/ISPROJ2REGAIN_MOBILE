class OrderProduct {
  String sellerUsername;
  String buyerUsername;
  String productName;
  String price;
  String location;
  bool isForDelivery;
  String deliveryDate;
  String paymentMode;
  List<OrderStatus> statusList; // List of statuses associated with the order

  OrderProduct({
    required this.sellerUsername,
    required this.buyerUsername,
    required this.productName,
    required this.price,
    required this.location,
    required this.isForDelivery,
    required this.deliveryDate,
    required this.paymentMode,
    required this.statusList, // Initialize with an empty list or predefined statuses
  });
}

enum OrderStatus {
  pending,
  inProgress,
  delivered,
  cancelled,
}
