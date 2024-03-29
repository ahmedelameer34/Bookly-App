import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookid;

  @HiveField(1)
  final String? image;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String? autherName;

  @HiveField(4)
  final double? price;

  @HiveField(5)
  final double? rating;

  @HiveField(6)
  final int? ratingCount;

  @HiveField(7)
  final String? currencyCode;

  @HiveField(8)
  final String? canonicalVolumeLink;

  BookEntity(
      {required this.canonicalVolumeLink,
      required this.image,
      required this.title,
      required this.autherName,
      required this.price,
      required this.rating,
      required this.bookid,
      required this.ratingCount,
      required this.currencyCode});
}
