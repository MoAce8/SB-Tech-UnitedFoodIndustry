import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';

class ChangeLangScreen extends StatefulWidget {
  const ChangeLangScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState extends State<ChangeLangScreen> {
  var selectedLang = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.1,
            horizontal: screenWidth(context) * 0.02),
        width: double.infinity,
        color: AppColors.white,
        child: Column(
          children: [
            Text(
              'اهلا بكم في تطبيقنا',
              style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: screenWidth(context) * 0.044),
            ),
            SizedBox(
              height: screenHeight(context) * 0.01,
            ),
            Text(
              'Welcome to our application',
              style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: screenWidth(context) * 0.044),
            ),
            SizedBox(
              height: screenHeight(context) * 0.01,
            ),
            Image.asset('asset/images/ic_logo.png'),
            SizedBox(
              height: screenHeight(context) * 0.01,
            ),
            Text(
              'من فضلك قم باختيار اللغة',
              style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: screenWidth(context) * 0.033,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context) * 0.005,
            ),
            Text(
              'Please select your language',
              style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: screenWidth(context) * 0.033,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context) * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: AppColors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: AppColors.black)),
                    ),
                    value: selectedLang,
                    style: TextStyle(
                      color: AppColors.textGrey,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text('عربي'),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English'),
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {
                        selectedLang = val!;
                      });
                    },
                  ),
                ),
                SizedBox(width: screenWidth(context) * 0.03),
                FloatingActionButton(
                  onPressed: () {
                    context.setLocale(Locale(selectedLang));
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.check),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: AppColors.primaryBlue,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
