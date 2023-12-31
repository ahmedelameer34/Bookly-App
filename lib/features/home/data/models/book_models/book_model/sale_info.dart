class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  ListPrice? listPrice;

  SaleInfo({this.country, this.saleability, this.isEbook, this.listPrice});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
      country: json['country'] as String?,
      saleability: json['saleability'] as String?,
      isEbook: json['isEbook'] as bool?,
      listPrice: json['listPrice'] == null
          ? null
          : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
      };
}

class ListPrice {
  double? amount;
  ListPrice({this.amount});
  factory ListPrice.fromJson(Map<String, dynamic> json) =>
      ListPrice(amount: json['amount'] as double);
}
