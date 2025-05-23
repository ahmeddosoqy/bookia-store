import 'package:bookia_store/core/model/get_cart_respnse/get_cart_respnse.dart';
import 'package:bookia_store/core/features/cart/data/model/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartCubitInitial());

  GetCartResponse? cartResponse;

  // Fetch the Cart data
  getCart() async {
    emit(CartLoadingState());
    await CartRepo.getCart().then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("Something went wrong"));
      }
    });
  }

  removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    await CartRepo.removeFromCart(cartItemId).then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("Something went wrong"));
      }
    });
  }

  Future<void> addToCart(int productId) async {
    emit(CartLoadingState());
    await CartRepo.addToCart(productId).then((value) {
      if (value) {
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("something went wrong"));
      }
    });
  }

  updateCart(dynamic cartItemId, dynamic quantity) async {
    emit(CartLoadingState());
    await CartRepo.updateCart(cartItemId, quantity).then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("Something went wrong"));
      }
    });
  }
}
