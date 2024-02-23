import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.offWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/images/ic_cart_empty@2x.png',
            width: screenWidth(context) * 0.5,
          ),
          SizedBox(
            height: screenHeight(context) * 0.04,
          ),
          Text(
            LocaleKeys.empty_cart.tr(),
            style: TextStyle(
              color: AppColors.primaryBlue,
              fontSize: screenWidth(context) * 0.05,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.02,
          ),
          SizedBox(
            width: screenWidth(context) * 0.5,
            child: AppButton(
                title: LocaleKeys.add_some_prods.tr(), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
