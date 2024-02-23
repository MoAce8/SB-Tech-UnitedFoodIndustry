import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/register/register_body.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.white,
          width: double.infinity,
          height: screenHeight(context),
          child: Stack(
            alignment: context.locale.toLanguageTag() == 'en'?Alignment.bottomRight:Alignment.bottomLeft,
            children: [
              Image.asset('asset/images/ic_footer_bg_2.png',
                  alignment: Alignment.bottomCenter),
              Positioned(
                bottom: screenHeight(context)*0.014,
                child: Image.asset('asset/images/ic_footer_2.png',
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      right: screenWidth(context) * 0.1,
                      left: screenWidth(context) * 0.1,
                      top: screenHeight(context) * 0.07),
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/images/ic_logo.png',
                        width: screenWidth(context) * 0.42,
                      ),
                      SizedBox(height: screenHeight(context) * 0.02),
                      Text(
                        LocaleKeys.sign_up.tr(),
                        style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: screenWidth(context) * 0.064, //24
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: screenHeight(context) * 0.01),
                      const RegisterBody(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
