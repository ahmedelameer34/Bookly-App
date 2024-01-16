part of 'best_seller_cubit.dart';

sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerPaginationLoading extends BestSellerState {}

class BestSellerPaginationFailure extends BestSellerState {
  final String failure;

  BestSellerPaginationFailure(this.failure);
}

final class BestSellerSuccess extends BestSellerState {
  final List<BookEntity> books;

  BestSellerSuccess(this.books);
}

final class BestSellerFailure extends BestSellerState {
  final String failure;

  BestSellerFailure(this.failure);
}
