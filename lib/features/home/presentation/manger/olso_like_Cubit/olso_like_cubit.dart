import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/domain/usecases/olso_like_usecase.dart';

part 'olso_like_state.dart';

class OlsoLikeCubit extends Cubit<OlsoLikeState> {
  OlsoLikeCubit(this.fetchOlsoLikeUseCase) : super(OlsoLikeInitial());
  final FetchOlsoLikeUseCase fetchOlsoLikeUseCase;
  Future<void> fetchOlsoLikeBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(OlsoLikeLoading());
    } else {
      emit(OlsoLikeLoading());
    }
    var result = await fetchOlsoLikeUseCase.call(pageNum = pageNum);
    result.fold((failure) {
      if (pageNum == 0) {
        emit(OlsoLikeFailure(failure.message.toString()));
      } else {
        emit(OlsoLikePaginationFailure(failure.message.toString()));
      }
    }, (books) {
      emit(OlsoLikeSuccess(books));
    });
  }
}
