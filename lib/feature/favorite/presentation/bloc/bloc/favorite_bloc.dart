import 'package:bloc/bloc.dart';
import 'package:t7mara/feature/favorite/data/models/response/favorite_response_model/favorite_response_model.dart';
import 'package:t7mara/feature/favorite/data/repo/repo_favorite.dart';
import 'package:t7mara/feature/favorite/presentation/bloc/bloc/favorite_event.dart';
import 'package:t7mara/feature/favorite/presentation/bloc/bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    //
    on<ShowFavoriteEvent>(showFavorite);
  }
  FavoriteResponseModel? favoriteResponseModel;
  Future<void> showFavorite(
      ShowFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoadingState());

    await FavoriteRepo.favoriteRepo().then(
      (value) {
        if (value != null) {
          favoriteResponseModel = value;
          emit(FavoriteLoadedState());
        } else {
          emit(FavoriteErrorState());
        }
      },
    );
  }
}
