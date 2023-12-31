class BookEntity {
  final String bookid;
  final String? image;
  final String title;
  final String? autherName;
  final double? price;
  final double? rating;
  final int? ratingCount;

  BookEntity(
      {required this.image,
      required this.title,
      required this.autherName,
      required this.price,
      required this.rating,
      required this.bookid,
      required this.ratingCount});
}
