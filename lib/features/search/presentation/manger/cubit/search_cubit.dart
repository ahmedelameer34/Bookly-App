import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/search/domain/use_cases/best_books_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());
  final SearchUseCase searchUseCase;

  Future<void> searchBooks({String query = ''}) async {
    if (query == '') {
      emit(SearchLoading());
    } else {
      emit(SearchResultLoading());
      var result = await searchUseCase.call(query);
      result.fold((failure) {
        emit(SearchFailure(failure.message.toString()));
      }, (books) {
        emit(SearchSuccess(books));
      });
    }
  }
}
