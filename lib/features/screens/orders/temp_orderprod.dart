// OrderProduct class containing order details and a list of statuses
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

// Enum for the status of the order
enum OrderStatus {
  toShip,
  inTransit,
  delivered,
  received,
  cancelled,
}

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.toShip:
        return "To Ship";
      case OrderStatus.inTransit:
        return "In Transit";
      case OrderStatus.delivered:
        return "Delivered";
      case OrderStatus.received:
        return "Received";
      case OrderStatus.cancelled:
        return "Cancelled";
      default:
        return "Unknown";
    }
  }
}