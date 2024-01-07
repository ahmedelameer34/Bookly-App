part of 'best_seller_cubit.dart';

sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerSuccess extends BestSellerState {
  final List<BookEntity> books;

  BestSellerSuccess(this.books);
}

final class BestSellerFailure extends BestSellerState {
  final String failure;

  BestSellerFailure(this.failure);
}
