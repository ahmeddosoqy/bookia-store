import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/model/get_cart_respnse/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.book,
    required this.onRemove,
    required this.onAddQuantity,
    required this.onRemoveQuantity,
  });
  final CartItem book;
  final Function() onRemove;
  final Function() onAddQuantity;
  final Function() onRemoveQuantity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: book.itemProductImage ?? "",
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
                      book.itemProductName ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CloseButton(onPressed: onRemove()),
                ],
              ),
              Gap(5),
              Text(
                "${book.itemProductPriceAfterDiscount} EGP",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(5),
              Row(
                children: [
                  FloatingActionButton.small(
                    onPressed: onAddQuantity,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add),
                  ),
                  Gap(5),
                  Text(book.itemQuantity.toString()),
                  Gap(5),
                  FloatingActionButton.small(
                    onPressed: onRemoveQuantity,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.remove),
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
