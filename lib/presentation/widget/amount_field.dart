import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';

class AmountField extends StatelessWidget {
  const AmountField({Key? key, required this.counter}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.1,
      child: TextField(
        controller: TextEditingController(text: counter.toString()),
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth(context) * 0.026,
              horizontal: screenWidth(context) * 0.015),
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
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
