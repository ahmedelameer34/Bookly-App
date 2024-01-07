import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/usecases/feature_books_usecase.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/featured_cubit/featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit(this.featureBooksUseCase) : super(FeaturedInitial());
  final FetchFeatureBooksUseCase featureBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedLoading());
    var result = await featureBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedFailure(failure.message.toString()));
    }, (books) {
      emit(FeaturedSuccess(books));
    });
  }
}
