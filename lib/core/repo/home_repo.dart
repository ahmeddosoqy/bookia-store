import 'dart:developer';
import 'package:bookia_store/core/model/get_best_seller_response/get_best_seller_response.dart';
import 'package:bookia_store/core/model/get_slider_model/get_slider_model.dart';
import 'package:bookia_store/core/services/dio_provider.dart';

class HomeRepo {
  static Future<GetBestSellerResponse?> getBestSellers() async {
    try {
      var response = await DioProvider.get(endpoint: "products-bestseller");
      if (response.statusCode == 200) {
        return GetBestSellerResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<GetSliderModel?> getSlider() async {
    try {
      var response = await DioProvider.get(endpoint: "sliders");
      if (response.statusCode == 200) {
        return GetSliderModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
