import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_screen.dart';

class RegisterConfirm extends StatefulWidget {
  const RegisterConfirm({Key? key}) : super(key: key);

  @override
  State<RegisterConfirm> createState() => _RegisterConfirmState();
}

class _RegisterConfirmState extends State<RegisterConfirm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.1,
            vertical: screenHeight(context) * 0.05),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              'asset/images/ic_logo.png',
              width: screenWidth(context) * 0.45,
            ),
            SizedBox(
              height: screenHeight(context) * 0.2,
            ),
            Text(
              LocaleKeys.you_registered.tr(),
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: screenWidth(context) * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              LocaleKeys.wait_for_approval.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: screenWidth(context) * 0.055,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Image.asset('asset/images/bottom.png'),
    );
  }
}
