//Temporary Models, take whats needed for offerView as buyer and as seller

class ViewProduct {
  int productID;
  String productName;
  String location;
  String price;
  String sellerUsername;
  String weight;
  String category;
  bool canDeliver;
  bool isFavorite;
  String offerStatus;

  ViewProduct({
    required this.productID,
    required this.productName,
    required this.location,
    required this.price,
    required this.sellerUsername,
    required this.weight,
    required this.category,
    required this.canDeliver,
    required this.isFavorite,
    required this.offerStatus,
  });
}

class BuyerOffer {
  final String buyerUsername;
  final String offerPrice;
  final String offerStatus;

  BuyerOffer({
    required this.buyerUsername,
    required this.offerPrice,
    required this.offerStatus,
  });
}
