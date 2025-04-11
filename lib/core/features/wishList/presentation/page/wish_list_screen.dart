import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/pages/main_app_screen.dart';
import 'package:bookia_store/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const MainAppScreen()),
            );
          },
          icon: SvgPicture.asset(AssetManager.back),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: 10,
        separatorBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(color: Colors.grey, height: 10),
            ),
        itemBuilder: (context, index) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://codingarabic.online/storage/product/JGQ1GLsrKZW4rEti21BdQyaZfOOHzz5oeolEA74X.jpg",
                  fit: BoxFit.cover,
                  height: 100,
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
                        Expanded(child: Text("Book Name")),
                        CloseButton(),
                      ],
                    ),
                    Gap(5),
                    Text("Price"),
                    Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          width: 170,
                          height: 40,
                          text: "Add to Cart",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
