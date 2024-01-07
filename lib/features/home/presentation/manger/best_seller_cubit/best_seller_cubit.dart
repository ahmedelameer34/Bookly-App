import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/usecases/best_books_usecase.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.fetchBestSellerUseCase) : super(BestSellerInitial());
  final FetchBestSellerUseCase fetchBestSellerUseCase;
  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerLoading());
    var result = await fetchBestSellerUseCase.call();
    result.fold((failure) {
      emit(BestSellerFailure(failure.message.toString()));
    }, (books) {
      emit(BestSellerSuccess(books));
    });
  }
}
