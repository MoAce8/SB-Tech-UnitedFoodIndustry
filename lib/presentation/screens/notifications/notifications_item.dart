import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth(context) * 0.02),
      margin: EdgeInsets.only(top: screenHeight(context) * 0.012),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            blurRadius: 6,
          )
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: context.locale.toLanguageTag()=='en'?CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Text(
            '12 min ago',
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: screenWidth(context)*0.028
            ),
          ),
          SizedBox(height: screenHeight(context)*0.005,),
          Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo',
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: screenWidth(context)*0.033
            ),
          ),
        ],
      ),
    );
  }
}
