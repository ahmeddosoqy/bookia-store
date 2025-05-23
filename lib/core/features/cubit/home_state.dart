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

final class AddToWishlistState extends HomeState {}

final class WishListLoadingState extends HomeState {}

final class WishListSuccessState extends HomeState {}

final class WishListErrorState extends HomeState {
  final String message;
  WishListErrorState(this.message);
}

final class AddToCartState extends HomeState {}

final class CartLoadingState extends HomeState {}

final class CartSuccessState extends HomeState {}

final class CartErrorState extends HomeState {
  final String message;
  CartErrorState(this.message);
}
