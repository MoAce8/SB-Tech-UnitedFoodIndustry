import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';
import 'package:unitedfoodindustery/presentation/widget/drawer_scaffold.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      title: LocaleKeys.wallet.tr(),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.04,
            horizontal: screenWidth(context) * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.wallet.tr(),
              style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: screenWidth(context) * 0.04,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: screenHeight(context)*0.015,),
            AppButton(title: LocaleKeys.wallet_button1.tr(), onPressed: (){}),
            SizedBox(height: screenHeight(context)*0.015,),
            AppButton(title: LocaleKeys.wallet_button2.tr(), onPressed: (){}),
            SizedBox(height: screenHeight(context)*0.015,),
            AppButton(title: LocaleKeys.wallet_button3.tr(), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
