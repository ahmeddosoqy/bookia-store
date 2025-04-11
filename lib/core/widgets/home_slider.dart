import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/features/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is SliderSuccessState ||
              current is SliderLoadingState ||
              current is SliderErrorState,
      builder: (context, state) {
        if (state is SliderSuccessState) {
          var slider =
              context.read<HomeCubit>().sliderResponse?.data?.sliders ?? [];
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: slider[itemIndex].image ?? "",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorWidget:
                          (context, url, error) =>
                              Center(child: Icon(Icons.error)),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Gap(10),
              SmoothPageIndicator(
                controller: PageController(initialPage: currentIndex),
                count: 3,
                effect: ExpandingDotsEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  expansionFactor: 4,
                  spacing: 5,
                  activeDotColor: AppColors.primaryColor,
                  dotColor: AppColors.darkGrey,
                ),
                onDotClicked: (index) {},
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
