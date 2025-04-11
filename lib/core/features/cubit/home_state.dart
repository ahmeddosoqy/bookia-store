part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class BestSellerLoadingState extends HomeState {}

final class BestSellerSuccessState extends HomeState {}

final class BestSellerErrorState extends HomeState {
  final String message;
  BestSellerErrorState(this.message);
}

final class SliderLoadingState extends HomeState {}

final class SliderSuccessState extends HomeState {}

final class SliderErrorState extends HomeState {
  final String message;
  SliderErrorState(this.message);
}
