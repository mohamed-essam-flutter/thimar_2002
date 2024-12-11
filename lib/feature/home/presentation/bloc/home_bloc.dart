import 'package:bloc/bloc.dart';
import 'package:t7mara/feature/home/data/models/response/banner_home_response_model/banner_home_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_drinks_response_model/categories_drinks_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_fruits_response_model/categories_fruits_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_home_response_model/categories_home_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_meals_response_models/categories_meals_response_models.dart';
import 'package:t7mara/feature/home/data/models/response/categories_vegetables_response_model/categories_vegetables_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/home_response_model/home_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/list_view_product_evaluation_response_model/list_view_product_evaluation_response_model.dart';
import 'package:t7mara/feature/home/data/repo/home_repo.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_event.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialHome()) {
    on<ShowHome>(showHome);
    on<BannerHome>(bannerHome);
    on<CategoriesHome>(categoriesHome);
    on<ProductEvaluationHome>(productEvaluationHome);
    on<CategoriesDrinksHome>(categoriesDrinksHome);
    on<CategoriesMealsHome>(categoriesMealsHome);
    on<CategoriesVegetablesHome>(categoriesVegetablesHome);
    on<CategoriesFruitsHome>(categoriesFruitsHome);
    on<AddToFavorite>(addToFavorite);
  }
  ListViewProductEvaluationResponseModel?
      listViewProductEvaluationResponseModel;
  HomeResponseModel? homeResponseModel;
  BannerHomeResponseModel? bannerHomeResponseModel;
  CategoriesHomeResponseModel? categoriesHomeResponseModel;
  CategoriesFruitsResponseModel? categoriesFruitsResponseModel;
  CategoriesMealsResponseModels? categoriesMealsResponseModels;
  CategoriesDrinksResponseModel? categoriesDrinksResponseModel;
  CategoriesVegetablesResponseModel? categoriesVegetablesResponseModel;

  Future<void> showHome(ShowHome event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    //api
    await HomeRepo.showHomeRepo().then(
      (value) {
        if (value != null) {
          homeResponseModel = value;
          emit(HomeLoadedState());
        } else {
          emit(HomeErrorState());
        }
      },
    );
  }

  Future<void> bannerHome(BannerHome event, Emitter<HomeState> emit) async {
    emit(BannerLoadingState());
    //api
    await HomeRepo.bannerHomeRepo().then(
      (value) {
        if (value != null) {
          bannerHomeResponseModel = value;
          emit(BannerLoadedState());
        } else {
          emit(BannerErrorState());
        }
      },
    );
  }

  Future<void> categoriesHome(
      CategoriesHome event, Emitter<HomeState> emit) async {
    emit(CategoriesLoadingState());
    //api
    await HomeRepo.categoriesHomeRepo().then(
      (value) {
        if (value != null) {
          categoriesHomeResponseModel = value;
          emit(CategoriesLoadedState());
        } else {
          emit(CategoriesErrorState());
        }
      },
    );
  }

  Future<void> productEvaluationHome(
      ProductEvaluationHome event, Emitter<HomeState> emit) async {
    emit(ProductEvaluationLoadingState());
    //api
    await HomeRepo.productEvaluationRepo().then(
      (value) {
        if (value != null) {
          listViewProductEvaluationResponseModel = value;
          emit(ProductEvaluationLoadedState());
        } else {
          emit(ProductEvaluationErrorState());
        }
      },
    );
  }

  Future<void> categoriesFruitsHome(
      CategoriesFruitsHome event, Emitter<HomeState> emit) async {
    emit(CategoriesFruitsLoadingState());
    //api
    await HomeRepo.categoriesFruitsRepo().then(
      (value) {
        if (value != null) {
          categoriesFruitsResponseModel = value;
          emit(CategoriesFruitsLoadedState());
        } else {
          emit(CategoriesFruitsErrorState());
        }
      },
    );
  }

  Future<void> categoriesVegetablesHome(
      CategoriesVegetablesHome event, Emitter<HomeState> emit) async {
    emit(CategoriesVegetablesLoadingState());
    //api
    await HomeRepo.categoriesVegetablesRepo().then(
      (value) {
        if (value != null) {
          categoriesVegetablesResponseModel = value;
          emit(CategoriesVegetablesLoadedState());
        } else {
          emit(CategoriesVegetablesErrorState());
        }
      },
    );
  }

  Future<void> categoriesMealsHome(
      CategoriesMealsHome event, Emitter<HomeState> emit) async {
    emit(CategoriesMealsLoadingState());
    //api
    await HomeRepo.categoriesMealsRepo().then(
      (value) {
        if (value != null) {
          categoriesMealsResponseModels = value;
          emit(CategoriesMealsLoadedState());
        } else {
          emit(CategoriesMealsErrorState());
        }
      },
    );
  }

  Future<void> categoriesDrinksHome(
      CategoriesDrinksHome event, Emitter<HomeState> emit) async {
    emit(CategoriesDrinksLoadingState());
    //api
    await HomeRepo.categoriesDrinksRepo().then(
      (value) {
        if (value != null) {
          categoriesDrinksResponseModel = value;
          emit(CategoriesDrinksLoadedState());
        } else {
          emit(CategoriesDrinksErrorState());
        }
      },
    );
  }

//add to favorite
  Future<void> addToFavorite(
      AddToFavorite event, Emitter<HomeState> emit) async {
    emit(AddToFavoriteLoadingState());
    //api
    await HomeRepo.addToFavoriteRepo(event.id).then(
      (value) {
        if (value == true) {
          emit(AddToFavoriteLoadedState());
        } else {
          emit(AddToFavoriteErrorState());
        }
      },
    );
  }
}
