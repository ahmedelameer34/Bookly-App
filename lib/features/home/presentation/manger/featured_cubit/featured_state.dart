import '../../../domain/entities/book_entity.dart';

sealed class FeaturedState {}

final class FeaturedInitial extends FeaturedState {}

final class FeaturedLoading extends FeaturedState {}

final class FeaturedPaginationLoading extends FeaturedState {}

class FeaturedPaginationFailure extends FeaturedState {
  final String failure;

  FeaturedPaginationFailure(this.failure);
}

final class FeaturedSuccess extends FeaturedState {
  final List<BookEntity> books;

  FeaturedSuccess(this.books);
}

final class FeaturedFailure extends FeaturedState {
  final String failure;

  FeaturedFailure(this.failure);
}
