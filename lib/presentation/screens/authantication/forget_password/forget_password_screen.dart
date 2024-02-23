import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/core/helper/validation.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/new_password/new_password_screen.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';
import 'package:unitedfoodindustery/presentation/widget/labeled_text_field.dart';
import 'package:unitedfoodindustery/presentation/widget/page_scaffold.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final mailController = TextEditingController();

  bool phoneUsed = true;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: LocaleKeys.forget_password2.tr(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.1),
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                ],
                label: phoneUsed
                    ? LocaleKeys.enter_mobile.tr()
                    : LocaleKeys.enter_mail.tr(),
                controller: phoneUsed ? phoneController : mailController,
                keyboard: phoneUsed
                    ? TextInputType.phone
                    : TextInputType.emailAddress,
                validator: (value) => phoneUsed
                    ? validateMobile(value ?? '')
                    : validateEmail(value ?? ''),
              ),
              SizedBox(
                height: screenHeight(context) * 0.02,
              ),
              AppButton(
                  title: LocaleKeys.send_code.tr(),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NewPasswordScreen()));
                    }
                  }),
              SizedBox(
                height: screenHeight(context) * 0.015,
              ),
              phoneUsed
                  ? Row(
                      children: [
                        Text(
                          LocaleKeys.no_mobile.tr(),
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: screenWidth(context) * 0.033,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              phoneUsed = false;
                            });
                          },
                          child: Text(
                            LocaleKeys.use_mail.tr(),
                            style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: screenWidth(context) * 0.033,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          phoneUsed = true;
                        });
                      },
                      child: Text(
                        LocaleKeys.use_mobile.tr(),
                        style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: screenWidth(context) * 0.033,
                            decoration: TextDecoration.underline),
                      ),
                    )
            ],
          ),
        ),
      ),
      bottom: Image.asset('asset/images/bottom.png'),
    );
  }
}
