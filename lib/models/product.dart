class Product {
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerUnit;
  late double unitPrice;
  late int unitsInStock;

  Product(
      {required this.id,
      required this.categoryId,
      required this.productName,
      required this.quantityPerUnit,
      required this.unitPrice,
      required this.unitsInStock});

  factory Product.fromJson(Map json) {
    return Product(
        id: json['id'],
        categoryId: json['categoryId'],
        productName: json['productName'],
        quantityPerUnit: json['quantityPerUnit'],
        unitPrice: double.tryParse(json['unitPrice'].toString())!,
        unitsInStock: json['unitsInStock']);
  }

  Map toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'productName': productName,
      'quantityPerUnit': quantityPerUnit,
      'unitPrice': unitPrice,
      'unitsInStock': unitsInStock
    };
  }
}
