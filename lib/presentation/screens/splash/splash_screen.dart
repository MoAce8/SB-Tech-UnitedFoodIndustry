import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/core/router/router.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool? logout;
  const SplashScreen({Key? key, this.logout}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      return MagicRouter.navigateAndPopAll( const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white
      ),
      child: Center(
        child: Image.asset('asset/images/ic_logo.png', width: screenWidth(context)*0.6,),
      ),
    );
  }
}
