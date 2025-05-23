import 'package:bookia_store/core/constants/app_colors.dart';
import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:bookia_store/core/features/app_pages/home_screen.dart';
import 'package:bookia_store/core/features/cart/presentation/page/cart_screen.dart';
import 'package:bookia_store/core/features/wishList/presentation/page/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   surfaceTintColor: Colors.transparent,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(builder: (context) => const WelcomePage()),
      //       );
      //     },
      //     icon: SvgPicture.asset(AssetManager.back),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
        unselectedIconTheme: IconThemeData(color: AppColors.darkGrey),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetManager.home),
            activeIcon: SvgPicture.asset(
              AssetManager.home,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetManager.bookmark),
            activeIcon: SvgPicture.asset(
              AssetManager.bookmark,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetManager.category),
            activeIcon: SvgPicture.asset(
              AssetManager.category,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetManager.profile),
            activeIcon: SvgPicture.asset(
              AssetManager.profile,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
        ],
        selectedItemColor: AppColors.primaryColor,
      ),
    );
  }
}
