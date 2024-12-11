import 'dart:developer';
import 'package:t7mara/core/constants/constant.dart';
import 'package:t7mara/core/services/dio.dart';
import 'package:t7mara/core/services/local_storage_application.dart';
import 'package:t7mara/feature/home/data/models/response/banner_home_response_model/banner_home_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_drinks_response_model/categories_drinks_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_fruits_response_model/categories_fruits_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_home_response_model/categories_home_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/categories_meals_response_models/categories_meals_response_models.dart';
import 'package:t7mara/feature/home/data/models/response/categories_vegetables_response_model/categories_vegetables_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/home_response_model/home_response_model.dart';
import 'package:t7mara/feature/home/data/models/response/list_view_product_evaluation_response_model/list_view_product_evaluation_response_model.dart';

class HomeRepo {
  static Future<HomeResponseModel?> showHomeRepo() async {
    try {
      var response = await DioProvider.getData(endPoint: AppConstant.showHome);
      if (response.statusCode == 200) {
        return HomeResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<BannerHomeResponseModel?> bannerHomeRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.bannerHome);
      if (response.statusCode == 200) {
        return BannerHomeResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoriesHomeResponseModel?> categoriesHomeRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.categoriesHome);
      if (response.statusCode == 200) {
        return CategoriesHomeResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<ListViewProductEvaluationResponseModel?>
      productEvaluationRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.productEvaluationHome);
      if (response.statusCode == 200) {
        return ListViewProductEvaluationResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoriesFruitsResponseModel?> categoriesFruitsRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.categoriesFruitsHome);
      if (response.statusCode == 200) {
        return CategoriesFruitsResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoriesVegetablesResponseModel?>
      categoriesVegetablesRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.categoriesVegetablesHome);
      if (response.statusCode == 200) {
        return CategoriesVegetablesResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoriesMealsResponseModels?> categoriesMealsRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.categoriesMealsHome);
      if (response.statusCode == 200) {
        return CategoriesMealsResponseModels.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoriesDrinksResponseModel?> categoriesDrinksRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.categoriesDrinksHome);
      if (response.statusCode == 200) {
        return CategoriesDrinksResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> addToFavoriteRepo(int id) async {
    try {
      var response = await DioProvider.post(
          endPoint: "/client/products/$id/add_to_favorite",
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }
}
