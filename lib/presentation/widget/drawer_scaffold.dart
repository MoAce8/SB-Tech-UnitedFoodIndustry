import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/tabs/drawer.dart';

class DrawerScaffold extends StatelessWidget {
  const DrawerScaffold({Key? key, required this.title, required this.body}) : super(key: key);

  final String title;
  final Widget body;

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
        title: Text(title,style: TextStyle(color: AppColors.primaryBlue),),
        centerTitle: true,
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
      body: body,
      drawer: const BuildDrawer(),
    );
  }
}
