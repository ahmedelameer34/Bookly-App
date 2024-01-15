part of 'olso_like_cubit.dart';

sealed class OlsoLikeState {}

final class OlsoLikeInitial extends OlsoLikeState {}

final class OlsoLikeLoading extends OlsoLikeState {}

final class OlsoLikeSuccess extends OlsoLikeState {
  final List<BookEntity> books;

  OlsoLikeSuccess(this.books);
}

final class OlsoLikeFailure extends OlsoLikeState {
  final String failure;

  OlsoLikeFailure(this.failure);
}
