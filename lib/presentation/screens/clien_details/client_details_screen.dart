import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/client_model.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';
import 'package:unitedfoodindustery/presentation/widget/page_scaffold.dart';

class ClientDetailsScreen extends StatelessWidget {
  const ClientDetailsScreen({Key? key, required this.client}) : super(key: key);

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: client.name,
      color: AppColors.offWhite,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.025,
            horizontal: screenWidth(context) * 0.085),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: screenWidth(context) * 0.22,
                    backgroundImage: AssetImage(
                      client.pic,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: screenWidth(context) * 0.01,
                      right: screenWidth(context) * 0.01,
                    ),
                    child: CircleAvatar(
                      radius: screenWidth(context) * 0.05,
                      backgroundColor: AppColors.primaryBlue,
                      child: Icon(
                        Icons.edit_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      LocaleKeys.mobile_number.tr(),
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context)*0.044,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.008,
                    ),
                    Text(
                     client.phone,
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context)*0.04,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.edit_outlined,
                  color: AppColors.primaryBlue,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            Text(
              LocaleKeys.address_book.tr(),
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: screenWidth(context)*0.05,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            Text(
              LocaleKeys.client_orders.tr(),
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: screenWidth(context)*0.05,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.04,
            ),
            AppButton(title: LocaleKeys.add_new_order, onPressed: (){})
          ],
        ),
      ),
    );
  }
}
