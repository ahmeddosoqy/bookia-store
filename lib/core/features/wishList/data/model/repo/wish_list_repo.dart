import 'dart:developer';

import 'package:bookia_store/core/model/wishlist_response/wishlist_response.dart';
import 'package:bookia_store/core/services/dio_provider.dart';
import 'package:bookia_store/core/services/shared_preferences.dart';

class WishListRepo {
  static Future<WishlistResponse?> getWishlist() async {
    try {
      var response = await DioProvider.get(
        endpoint: "wishlist",
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedData(AppLocalStorage.tokenKey)}",
        }, // Use the token from local storage
      );
      if (response.statusCode == 200) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: "add-to-wishlist",
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedData(AppLocalStorage.tokenKey)}",
        }, // Use the token from local storage
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<WishlistResponse?> removeFromWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: "remove-from-wishlist",
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedData(AppLocalStorage.tokenKey)}",
        }, // Use the token from local storage
      );
      if (response.statusCode == 200) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
