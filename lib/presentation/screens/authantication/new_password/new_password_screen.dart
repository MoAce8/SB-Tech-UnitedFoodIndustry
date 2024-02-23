import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/core/helper/validation.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_screen.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';
import 'package:unitedfoodindustery/presentation/widget/labeled_text_field.dart';
import 'package:unitedfoodindustery/presentation/widget/page_scaffold.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  final otpController = TextEditingController();
  final newPassController = TextEditingController();
  final confNewPassController = TextEditingController();

  bool passwordVisible = true;
  bool confPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: LocaleKeys.forget_password2.tr(),
      bottom: Image.asset('asset/images/bottom.png'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.1,
            vertical: screenHeight(context)*0.02
          ),
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  LocaleKeys.we_sent_code.tr(),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: screenWidth(context) * 0.044,
                  ),
                ),
                SizedBox(height: screenHeight(context)*0.05,),
                LabeledTextField(
                  label:
                  LocaleKeys.enter_code.tr(),
                  controller: otpController,
                  keyboard: TextInputType.phone,
                  validator: (value) =>validateOtpCode(value??''),
                ),
                SizedBox(
                  height: screenHeight(context) * 0.02,
                ),
                LabeledTextField(
                  label: LocaleKeys.new_password.tr(),
                  controller: newPassController,
                  keyboard: TextInputType.visiblePassword,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ],
                  obscure: passwordVisible,
                  validator: (value) => validatePassword(value ?? ''),
                  suffix: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) * 0.02,
                ),
                LabeledTextField(
                  label: LocaleKeys.confirm_new_password.tr(),
                  controller: confNewPassController,
                  keyboard: TextInputType.visiblePassword,
                  obscure: confPasswordVisible,
                  validator: (value) => validatePassword(value ?? ''),
                  suffix: IconButton(
                    icon: Icon(
                      confPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        confPasswordVisible = !confPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight(context) * 0.05,
                ),
                AppButton(title: LocaleKeys.reset_password.tr(), onPressed: (){
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => const LoginScreen()));
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
