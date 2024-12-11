import 'dart:developer';

import 'package:t7mara/core/constants/constant.dart';
import 'package:t7mara/core/services/dio.dart';
import 'package:t7mara/core/services/local_storage_application.dart';
import 'package:t7mara/feature/favorite/data/models/response/favorite_response_model/favorite_response_model.dart';

class FavoriteRepo {
  //register
  static Future<FavoriteResponseModel?> favoriteRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showFavorite,
          header: {
            // "token":LocalStorage.token
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return FavoriteResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
