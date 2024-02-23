import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Image.asset('asset/images/bottom.png'),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              right: screenWidth(context) * 0.1,
              left: screenWidth(context) * 0.1,
              top: screenHeight(context) * 0.1),
          child: Column(
            children: [
              Image.asset(
                'asset/images/ic_logo.png',
                width: screenWidth(context) * 0.45,
              ),
              SizedBox(height: screenHeight(context) * 0.05),
              Text(
                LocaleKeys.sign_in.tr(),
                style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: screenWidth(context) * 0.067, //24
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight(context) * 0.03),
              const LoginBody(),
            ],
          ),
        ),
      ),
    );
  }
}
