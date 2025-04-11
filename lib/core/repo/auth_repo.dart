import 'dart:developer';
import 'package:bookia_store/core/model/request/auth_params.dart';
import 'package:bookia_store/core/model/response/login_response/login_response.dart';
import 'package:bookia_store/core/model/response/register_response/register_response.dart';
import 'package:bookia_store/core/services/dio_provider.dart';

class AuthRepo {
  static Future<RegisterResponse?> register(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: "register",
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        return RegisterResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to register");
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<LoginResponse?> login(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: "login",
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to login");
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
