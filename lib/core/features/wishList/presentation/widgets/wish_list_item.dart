import 'package:bookia_store/core/model/get_best_seller_response/product.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({
    super.key,
    required this.book,
    required this.onRemove,
    required this.onAddToCart,
  });
  final Product book;
  final Function() onRemove;
  final Function() onAddToCart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: book.image ?? "",
            fit: BoxFit.cover,
            height: 120,
            width: 100,
          ),
        ),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      book.name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CloseButton(
                    onPressed: () {
                      onRemove();
                    },
                  ),
                ],
              ),
              Gap(5),
              Text(
                "${book.price} EGP",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    width: 170,
                    height: 40,
                    text: "Add to Cart",
                    onPressed: () {
                      onAddToCart();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
