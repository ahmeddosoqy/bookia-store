import 'package:bookia_store/core/features/cart/data/model/repo/cart_repo.dart';
import 'package:bookia_store/core/features/wishList/data/model/repo/wish_list_repo.dart';
import 'package:bookia_store/core/model/wishlist_response/wishlist_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListCubitInitial());

  WishlistResponse? wishListResponse;

  // Fetch the wishlist data
  getWishList() async {
    emit(WishListLoadingState());
    await WishListRepo.getWishlist().then((value) {
      if (value != null) {
        wishListResponse = value;
        emit(WishListSuccessState());
      } else {
        emit(WishListErrorState("Something went wrong"));
      }
    });
  }

  removeFromWishList(int productId) async {
    emit(WishListLoadingState());
    await WishListRepo.removeFromWishlist(productId).then((value) {
      if (value != null) {
        wishListResponse = value;
        emit(WishListSuccessState());
      } else {
        emit(WishListErrorState("Something went wrong"));
      }
    });
  }

  Future<void> addToCart(int productId) async {
    emit(AddToCartLoadingState());
    await CartRepo.addToCart(productId).then((value) {
      if (value) {
        emit(AddToCartSuccessState());
      } else {
        emit(AddToCartErrorState("something went wrong"));
      }
    });
  }
}
