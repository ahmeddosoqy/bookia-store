import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/constants/text_style.dart';
import 'package:bookia_store/core/features/app_pages/home_screen.dart';
import 'package:bookia_store/core/features/cubit/home_cubit.dart';
import 'package:bookia_store/core/model/get_best_seller_response/product.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is WishListSuccessState) {
            showSuccessToast(context, "Added to wishlist");
          } else if (state is WishListErrorState) {
            showErrorToast(context, "Something went wrong");
          } else if (state is WishListLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder:
            (context, state) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<HomeCubit>().addToWishlist(book.id ?? 0);
                      showSuccessToast(context, "Added to wishlist");
                    },
                    icon: SvgPicture.asset(AssetManager.bookmark),
                  ),
                ],
                surfaceTintColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(AssetManager.back),
                ),
                backgroundColor: Colors.white,
              ),
              body: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Hero(
                              tag: book.id ?? "",
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: book.image ?? "",
                                  height: 270,
                                ),
                              ),
                            ),
                            Gap(10),
                            Text(
                              book.name ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(10),
                            Text(
                              book.category ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Gap(10),
                            Text(
                              book.description ?? "",
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${book.priceAfterDiscount}",
                      style: getTitleStyle(context),
                    ),
                    CustomButton(
                      width: 170,
                      text: "Add to Cart",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
