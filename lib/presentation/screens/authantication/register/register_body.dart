import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/core/helper/validation.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/register_confirm/register_confirm_screen.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';
import 'package:unitedfoodindustery/presentation/widget/labeled_text_field.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  var formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: LabeledTextField(
                  label: LocaleKeys.first_name.tr(),
                  controller: firstNameController,
                  validator: (value) => validateName(value ?? ''),
                ),
              ),
              SizedBox(width: screenWidth(context)*0.03,),
              Expanded(
                child: LabeledTextField(
                  label: LocaleKeys.last_name.tr(),
                  controller: lastNameController,
                  validator: (value) => validateName(value ?? ''),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight(context) * 0.012,
          ),
          LabeledTextField(
            label: LocaleKeys.email.tr(),
            controller: emailController,
            keyboard: TextInputType.emailAddress,
            validator: (value) => validateEmail(value ?? ''),
          ),
          SizedBox(
            height: screenHeight(context) * 0.012,
          ),
          LabeledTextField(
            label: LocaleKeys.phone.tr(),
            controller: phoneController,
            keyboard: TextInputType.number,
            validator: (value) => validateMobile(value ?? ''),
          ),
          SizedBox(
            height: screenHeight(context) * 0.012,
          ),
          LabeledTextField(
            label: LocaleKeys.password.tr(),
            controller: passwordController,
            keyboard: TextInputType.visiblePassword,
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
          AppButton(
              title: LocaleKeys.sign_up.tr(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const RegisterConfirm()));
                }
              }),
          SizedBox(
            height: screenHeight(context) * 0.01,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.have_account.tr(),
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: screenWidth(context) * 0.033,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => const LoginScreen()));
                },
                child: Text(
                  LocaleKeys.login_now.tr(),
                  style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: screenWidth(context) * 0.033,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight(context)*0.03,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    LocaleKeys.by_signing.tr(),
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: screenWidth(context) * 0.033,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      LocaleKeys.our.tr(),
                      style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: screenWidth(context) * 0.033,
                          decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: Text(
                  LocaleKeys.terms.tr(),
                  style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: screenWidth(context) * 0.033,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
