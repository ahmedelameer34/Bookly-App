part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookEntity> books;
  SearchSuccess(this.books);
}

final class SearchResultLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String failure;

  SearchFailure(this.failure);
}
