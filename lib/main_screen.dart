import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/material.dart';

import 'package:product_shop_api/theme/color.dart';
import 'package:product_shop_api/view/favorite_screen/favorite_screen.dart';
import 'package:product_shop_api/view/home_screen/home_screen.dart';
import 'package:product_shop_api/view/message_screen/message_screen.dart';
import 'package:product_shop_api/view/profile_screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List _listOfWidget = [
    HomeScreen(),
    FavoriteScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            _listOfWidget.length, (index) => _listOfWidget[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (_listOfWidget.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: AppColors.blueColor,
              showLabel: false,
              notchColor: AppColors.blueColor,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: AppColors.gryColor,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite_border,
                    color: AppColors.gryColor,
                  ),
                  activeItem: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),

                ///svg example
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.message,
                    color: AppColors.gryColor,
                  ),
                  activeItem: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),

                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: AppColors.gryColor,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages

                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
