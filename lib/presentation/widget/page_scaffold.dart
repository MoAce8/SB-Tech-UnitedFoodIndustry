import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.bottom,
    this.color = AppColors.white,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? bottom;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.primaryBlue,
              fontSize: screenWidth(context) * 0.067,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              textDirection: TextDirection.ltr, color: AppColors.primaryBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: bottom,
    );
  }
}
