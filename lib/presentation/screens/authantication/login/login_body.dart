import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/core/helper/validation.dart';
import 'package:unitedfoodindustery/core/utiles/base_state.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/forget_password/forget_password_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/cubit/login_cubit.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/cubit/login_state.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/register/register_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/tabs/tabs_screen.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';
import 'package:unitedfoodindustery/presentation/widget/labeled_text_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Form(
            key: formKey,
            child: Column(
              children: [
                LabeledTextField(
                  label: LocaleKeys.email.tr(),
                  controller: emailController,
                  keyboard: TextInputType.emailAddress,
                  validator: (value) => validateEmail(value ?? ''),
                  onChanged: cubit.setEmail,
                ),
                SizedBox(
                  height: screenHeight(context) * 0.02,
                ),
                LabeledTextField(
                  label: LocaleKeys.password.tr(),
                  controller: passwordController,
                  keyboard: TextInputType.visiblePassword,
                  obscure: passwordVisible,
                  onChanged: cubit.setPassword,
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
                  height: screenHeight(context) * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.forget_password1.tr(),
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context) * 0.033,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ForgetPasswordScreen()));
                      },
                      child: Text(
                        LocaleKeys.click_here.tr(),
                        style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: screenWidth(context) * 0.033,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight(context) * 0.02,
                ),
                AppButton(
                    title: LocaleKeys.sign_in.tr(),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.login(
                            userName: state.userName, password: state.password);
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            TabsScreen(),));
                      }
                    }),
                SizedBox(
                  height: screenHeight(context) * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.have_no_account.tr(),
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context) * 0.033,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const RegisterScreen()));
                      },
                      child: Text(
                        LocaleKeys.sign_up_now.tr(),
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
        },
      ),
    );
  }
}
