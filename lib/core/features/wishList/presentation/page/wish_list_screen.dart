import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/features/wishList/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia_store/core/pages/main_app_screen.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:bookia_store/core/features/wishList/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishList(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainAppScreen()),
              );
            },
            icon: SvgPicture.asset(AssetManager.back),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<WishListCubit, WishListState>(
          buildWhen:
              (previous, current) =>
                  current is WishListSuccessState ||
                  current is WishListErrorState ||
                  current is WishListLoadingState,
          listener: (context, state) {
            if (state is AddToCartSuccessState) {
              Navigator.pop(context);
              showSuccessToast(context, "Added to cart");
            } else if (state is AddToCartErrorState) {
              Navigator.pop(context);
              showErrorToast(context, "Something went wrong");
            } else if (state is AddToCartLoadingState) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            if (state is WishListSuccessState) {
              var books =
                  context.read<WishListCubit>().wishListResponse?.data?.data ??
                  [];
              return books.isEmpty
                  ? const Center(
                    child: Text(
                      'No books in your wishlist',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  )
                  : ListView.separated(
                    padding: EdgeInsets.all(20),
                    itemCount: books.length,
                    separatorBuilder:
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: const Divider(color: Colors.grey, height: 30),
                        ),
                    itemBuilder: (context, index) {
                      return WishListItem(
                        book: books[index],
                        onRemove: () {
                          context.read<WishListCubit>().removeFromWishList(
                            books[index].id ?? 0,
                          );
                        },
                        onAddToCart: () {
                          context.read<WishListCubit>().addToCart(
                            books[index].id ?? 0,
                          );
                        },
                      );
                    },
                  );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
