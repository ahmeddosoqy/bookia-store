import 'package:bookia_store/core/cubit/auth_states.dart';
import 'package:bookia_store/core/model/request/auth_params.dart';
import 'package:bookia_store/core/repo/auth_repo.dart';
import 'package:bookia_store/core/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  register(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.register(params).then((value) {
      if (value != null) {
        AppLocalStorage.cachData(AppLocalStorage.tokenKey, value.data?.token);
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: "something went wrong"));
      }
    });
  }

  login(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.login(params).then((value) {
      if (value != null) {
        AppLocalStorage.cachData(AppLocalStorage.tokenKey, value.data?.token);
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: "something went wrong"));
      }
    });
  }
}
