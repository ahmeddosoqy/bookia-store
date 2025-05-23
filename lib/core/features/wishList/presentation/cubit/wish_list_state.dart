part of 'wish_list_cubit.dart';

sealed class WishListState {}

final class WishListCubitInitial extends WishListState {}

final class WishListLoadingState extends WishListState {}

final class WishListSuccessState extends WishListState {}

final class WishListErrorState extends WishListState {
  final String message;
  WishListErrorState(this.message);
}

final class AddToCartLoadingState extends WishListState {}

final class AddToCartSuccessState extends WishListState {}

final class AddToCartErrorState extends WishListState {
  final String message;
  AddToCartErrorState(this.message);
}
