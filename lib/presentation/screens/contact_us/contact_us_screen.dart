import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';
import 'package:unitedfoodindustery/presentation/widget/drawer_scaffold.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      title: LocaleKeys.contact_us.tr(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.025,
            horizontal: screenWidth(context) * 0.1,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth(context) * 0.06),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.enter_message.tr(),
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    TextFormField(
                      maxLines: null,
                      minLines: 6,
                      controller: messageController,
                      style: TextStyle(fontSize: screenWidth(context) * 0.05),
                      decoration: InputDecoration(
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryBlue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryBlue)),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    AppButton(title: LocaleKeys.send.tr(), onPressed: () {})
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 0.03,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth(context) * 0.06),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sales Office',
                      style: TextStyle(
                        color: AppColors.textDarkGrey,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    Text(
                      '46 Al Markaz El Raeisy street, Merag city, Behind Carrefour Maadi',
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context) * 0.033,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    Text(
                      'Factory',
                      style: TextStyle(
                        color: AppColors.textDarkGrey,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    Text(
                      '6th of October City, 2nd Industrial Zone, plot No. 77',
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context) * 0.033,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    Text(
                      LocaleKeys.mobile_number.tr(),
                      style: TextStyle(
                        color: AppColors.textDarkGrey,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    InfoRow(title: 'Sales Office', data: '+20 1227475540'),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    InfoRow(title: 'Factory', data: '+20 1275151111'),
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    Text(
                      LocaleKeys.email.tr(),
                      style: TextStyle(
                        color: AppColors.textDarkGrey,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    InfoRow(title: 'Sales Contact', data: 'sales@ufiegypt.com'),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    InfoRow(title: 'Technical support', data: 'technical@ufiegypt.com'),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    InfoRow(title: 'Customer service',data: 'cs@ufiegypt.com'),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    InfoRow(title: 'Work with us', data: 'cv@ufiegypt.com'),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    InfoRow(title: 'Exports', data: 'export@ufiegypt.com'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key, required this.title, required this.data,
  });
  
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          softWrap: true,
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: screenWidth(context) * 0.033,
          ),
        ),
        Text(
          data,
          softWrap: true,
          style: TextStyle(
            color: AppColors.textGrey,
            fontSize: screenWidth(context) * 0.033,
          ),
        ),
      ],
    );
  }
}
