import 'dart:developer';

import 'package:bookia_store/core/model/get_cart_respnse/get_cart_respnse.dart';
import 'package:bookia_store/core/services/dio_provider.dart';
import 'package:bookia_store/core/services/shared_preferences.dart';

class CartRepo {
  static Future<GetCartResponse?> getCart() async {
    try {
      var response = await DioProvider.get(
        endpoint: "cart",
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedData(AppLocalStorage.tokenKey)}",
        }, // Use the token from local storage
      );
      if (response.statusCode == 200) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToCart(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: "add-to-cart",
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedData(AppLocalStorage.tokenKey)}",
        }, // Use the token from local storage
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<GetCartResponse?> removeFromCart(int cartItemId) async {
    try {
      var response = await DioProvider.post(
        endpoint: "remove-from-cart",
        data: {"product_id": cartItemId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedData(AppLocalStorage.tokenKey)}",
        }, // Use the token from local storage
      );
      if (response.statusCode == 200) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<GetCartResponse?> updateCart(
    dynamic quantity,
    dynamic cartItemId,
  ) async {
    try {
      var response = await DioProvider.post(
        endpoint: "update-cart",
        data: {"cart_item_id": cartItemId, "quantity": quantity},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedData(AppLocalStorage.tokenKey)}",
        }, // Use the token from local storage
      );
      if (response.statusCode == 201) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
