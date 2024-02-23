import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeFromHeight(context, 22),

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: AppColors.primaryBlue,
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 10
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(context) * 0.044,
            ),
          ),
        ),
      ),
    );
  }
}
