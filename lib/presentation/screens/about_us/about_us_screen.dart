import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/widget/drawer_scaffold.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      title: LocaleKeys.about_us.tr(),
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
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita',
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
                        'Title',
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
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
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
                        'Title',
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
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                        softWrap: true,
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: screenWidth(context) * 0.033,
                        ),
                      ),
                    ],
                  )),
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
                      LocaleKeys.copyrights.tr(),
                      style: TextStyle(
                        color: AppColors.textDarkGrey,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.015,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '© 2021 UFI',
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: screenWidth(context) * 0.033,
                              ),
                            ),
                            Text(
                              LocaleKeys.version.tr(),
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: screenWidth(context) * 0.033,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context) * 0.01,
                        ),
                        Text(
                          LocaleKeys.all_rights.tr(),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: screenWidth(context) * 0.033,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context) * 0.015,
                        ),
                        Text(
                          LocaleKeys.designed_by.tr(),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: screenWidth(context) * 0.033,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context) * 0.01,
                        ),
                        Text(
                          'Apps Index an SB Technology Company',
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontSize: screenWidth(context) * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
