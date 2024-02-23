import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/profile/data/date_order_model.dart';

class DatedOrderItem extends StatelessWidget {
   const DatedOrderItem({Key? key, required this.date, required this.onTab, required this.activeDate}) : super(key: key);

  final DateOrderModel date;
  final void Function()? onTab;
  final String activeDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(screenWidth(context)*0.02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.black),
            color: activeDate == date.date? AppColors.lightBlue:AppColors.navBarGrey
        ),
        child: Column(
          children: [
            Text(
              date.date,
              style: TextStyle(
                color: AppColors.textDarkGrey,
                fontSize: screenWidth(context)*0.035
              ),
            ),
            Text(
              '(${date.orders.length})',
              style: TextStyle(
                color: AppColors.textDarkGrey,
                fontSize: screenWidth(context)*0.035
              ),
            ),
          ],
        ),
      ),
    );
  }
}
