import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/text_style.dart';
import 'package:bookia_store/core/extentions/extentions.dart';
import 'package:bookia_store/core/features/app_pages/book_details.dart';
import 'package:bookia_store/core/features/cubit/home_cubit.dart';
import 'package:bookia_store/core/model/get_best_seller_response/product.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is BestSellerSuccessState ||
              current is BestSellerLoadingState ||
              current is BestSellerErrorState,
      builder: (context, state) {
        if (state is BestSellerSuccessState) {
          var books =
              context.read<HomeCubit>().bestSellerResponse?.data?.products ??
              [];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Best Sellers", style: getBodyStyle(context)),
                Gap(10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 250,
                  )),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BookItem(book: books[index]);
                  },
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});
  final Product book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTo(BookDetails(book: book));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: book.id ?? "",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: book.image ?? "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorWidget:
                        (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),
            Text(
              book.name ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: getSmallStyle(context, fontSize: 14),
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${book.priceAfterDiscount}",
                  style: getSmallStyle(context, fontSize: 12),
                ),
                CustomButton(
                  width: 80,
                  height: 30,
                  text: "Buy",
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
