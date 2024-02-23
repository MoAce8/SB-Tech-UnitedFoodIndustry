import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/cart/cart_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/categories/categories_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/clients/clients_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/home/home_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/profile/profile_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/tabs/bottom_nav.dart';
import 'package:unitedfoodindustery/presentation/screens/tabs/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int activeScreen = 0;

  List navScreens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ClientsScreen(),
    ProfileScreen()
  ];

  void selectScreen(int id) {
    setState(() {
      activeScreen = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.black,
        elevation: 2,
        leadingWidth: screenWidth(context) * 0.2,
        title: TextField(
            decoration: InputDecoration(
          suffixIconConstraints:
              BoxConstraints(maxHeight: screenHeight(context) * 0.04),
          suffixIcon: Icon(
            CupertinoIcons.search,
            size: screenWidth(context) * 0.06,
            color: AppColors.primaryBlue,
          ),
          isCollapsed: true,
          contentPadding: EdgeInsets.all(screenWidth(context) * 0.011),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryBlue,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryBlue, width: 1),
          ),
        )),
        iconTheme: IconThemeData(
          size: screenWidth(context) * 0.105,
          color: AppColors.primaryBlue,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 6, top: 4, bottom: 4),
            child: Image.asset(
              'asset/images/logo.png',
              height: screenHeight(context) * 0.075,
              width: screenWidth(context) * 0.2,
            ),
          ),
        ],
      ),
      body: navScreens[activeScreen],
      bottomNavigationBar: BuildBottomNavBar(
          selectScreen: selectScreen, activeScreen: activeScreen),
      drawer: const BuildDrawer(),
    );
  }
}
