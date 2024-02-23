import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/core/helper/validation.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/change_lang/change_lang_screen.dart';
import 'package:unitedfoodindustery/presentation/widget/drawer_scaffold.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final passwordController = TextEditingController(text: 'lol');
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      title: LocaleKeys.settings.tr(),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.04,
            horizontal: screenWidth(context) * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lock,
                  color: AppColors.textDarkGrey,
                ),
                SizedBox(
                  width: screenWidth(context) * 0.02,
                ),
                Text(
                  LocaleKeys.password.tr(),
                  style: TextStyle(
                      color: AppColors.textDarkGrey,
                      fontSize: screenWidth(context) * 0.04,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.edit_outlined,
                  color: AppColors.primaryBlue,
                )
              ],
            ),
            SizedBox(
              height: screenHeight(context) * 0.02,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: passwordVisible,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => validatePassword(value ?? ''),
              onChanged: (val) {},
              style: TextStyle(fontSize: screenWidth(context) * 0.05),
              decoration: InputDecoration(
                  isDense: true,
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textGrey)),
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  suffixIconColor: AppColors.blue,
                  suffixIconConstraints:
                      BoxConstraints(maxHeight: screenHeight(context) * 0.04)),
            ),
            SizedBox(
              height: screenHeight(context) * 0.02,
            ),
            Divider(
              color: AppColors.primaryBlue,
              thickness: 1,
            ),
            SizedBox(
              height: screenHeight(context) * 0.04,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.globe,
                  color: AppColors.textDarkGrey,
                ),
                SizedBox(
                  width: screenWidth(context) * 0.02,
                ),
                Text(
                  LocaleKeys.language.tr(),
                  style: TextStyle(
                      color: AppColors.textDarkGrey,
                      fontSize: screenWidth(context) * 0.04,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   context.setLocale(Locale(
                    //       context.locale.toLanguageTag() == 'ar'
                    //           ? 'en'
                    //           : 'ar'));
                    // });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChangeLangScreen())).then((value) {
                      setState(
                        () {},
                      );
                    });
                  },
                  child: Icon(
                    Icons.edit_outlined,
                    color: AppColors.primaryBlue,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight(context) * 0.01,
            ),
            Text(
              LocaleKeys.lang.tr(),
              style: TextStyle(
                color: AppColors.textDarkGrey,
                fontSize: screenWidth(context) * 0.04,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.04,
            ),
            Container(
              height: sizeFromHeight(context, 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: AppColors.primaryBlue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people),
                    SizedBox(
                      width: screenWidth(context) * 0.02,
                    ),
                    Text(
                      LocaleKeys.invite.tr(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(context) * 0.044,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
