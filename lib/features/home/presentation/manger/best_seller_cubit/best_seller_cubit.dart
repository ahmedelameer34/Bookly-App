import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/usecases/best_books_usecase.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.fetchBestSellerUseCase) : super(BestSellerInitial());
  final FetchBestSellerUseCase fetchBestSellerUseCase;
  Future<void> fetchBestSellerBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(BestSellerLoading());
    } else {
      emit(BestSellerLoading());
    }
    var result = await fetchBestSellerUseCase.call(pageNum = pageNum);
    result.fold((failure) {
      if (pageNum == 0) {
        emit(BestSellerFailure(failure.message.toString()));
      } else {
        emit(BestSellerPaginationFailure(failure.message.toString()));
      }
    }, (books) {
      emit(BestSellerSuccess(books));
    });
  }
}
