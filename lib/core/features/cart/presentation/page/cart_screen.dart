import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_store/core/features/cart/presentation/widgets/cart_items.dart';
import 'package:bookia_store/core/pages/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Cart',
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
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CartSuccessState) {
              var books =
                  context.read<CartCubit>().cartResponse?.data?.cartItems ?? [];
              return books.isEmpty
                  ? const Center(
                    child: Text(
                      'No books in your Cart',
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
                      return CartItemWidget(
                        book: books[index],
                        onRemove: () {
                          context.read<CartCubit>().removeFromCart(
                            books[index].itemId ?? 0,
                          );
                        },
                        onAddQuantity: () {
                          if ((books[index].itemQuantity ?? 0) <
                              (books[index].itemProductStock ?? 0)) {
                            context.read<CartCubit>().updateCart(
                              books[index].itemId ?? 0,
                              (books[index].itemQuantity ?? 0) + 1,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No more stock available"),
                              ),
                            );
                          }
                        },
                        onRemoveQuantity: () {
                          if ((books[index].itemQuantity ?? 0) > 1) {
                            context.read<CartCubit>().updateCart(
                              books[index].itemId ?? 0,
                              (books[index].itemQuantity ?? 0) - 1,
                            );
                          }
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
