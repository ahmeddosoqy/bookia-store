import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/features/cubit/home_cubit.dart';
import 'package:bookia_store/core/widgets/best_seller_widget.dart';
import 'package:bookia_store/core/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) =>
              HomeCubit()
                ..getBestSeller()
                ..getSlider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: SvgPicture.asset(AssetManager.logo, height: 30),
          surfaceTintColor: Colors.transparent,

          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AssetManager.search),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AssetManager.notification),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HomeSlider(), BestSellerWidget()],
          ),
        ),
      ),
    );
  }
}
