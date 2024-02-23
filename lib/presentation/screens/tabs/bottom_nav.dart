import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';

class BuildBottomNavBar extends StatelessWidget {
  const BuildBottomNavBar({
    Key? key,
    required this.selectScreen,
    required this.activeScreen,
  }) : super(key: key);

  final void Function(int) selectScreen;
  final int activeScreen;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: selectScreen,
      currentIndex: activeScreen,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: AppColors.navGrey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: screenWidth(context) * 0.028,
      selectedFontSize: screenWidth(context) * 0.028,
      iconSize: screenWidth(context) * 0.085,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: LocaleKeys.home.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cake),
          label: LocaleKeys.Categories.tr(),
        ),
         BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cart_fill),
           label: LocaleKeys.Cart.tr(),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: LocaleKeys.Clients.tr(),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: LocaleKeys.Profile.tr(),
        ),
      ],
    );
  }
}
