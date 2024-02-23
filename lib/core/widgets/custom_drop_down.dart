// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/router/router.dart';
import 'package:unitedfoodindustery/generator/localization_constant.dart';
import 'package:unitedfoodindustery/presentation/screens/splash/splash_screen.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.valoe,
      this.validator,required this.onChange})
      : super(key: key);
  final List<String>? items;
  final String text;
  final String? valoe;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final Function(String?)? onChange;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _chosenValue;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: (widget.borderColor == null)
            ? Border.all(color: colorGrey3.withOpacity(0.2))
            : Border.all(color: widget.borderColor!),
        color: widget.fillColor!,
      ),
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: DropdownButtonFormField<String>(
        validator: (value) {

          return ((widget.valoe == ''||widget.valoe ==null)||_chosenValue == '' )? "مطلوب *" : null;
        },
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: colorGrey3,
          size: 30,
        ),
        iconSize: 32,
        iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: _chosenValue,
        items: widget.items?.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        hint: Text(
          widget.text,
          style: headingStyle.copyWith(
              color: colorGrey3, fontSize: screenWidth(context) * 0.032),
        ),
        onChanged: (String? value) {

          setState(() {
            _chosenValue = value;
          });
          widget.onChange!(value);
          if (value == "English") {
            setLocale('en');
            prefs.setString('lang', 'en');
            prefs.setString('language', 'English');
            context.locale = const Locale('en');
            MagicRouter.navigateAndPopAll(const SplashScreen());
          }
          if(value == "العربية"){
            setLocale('ar');
            prefs.setString('lang', 'ar');
            prefs.setString('language', 'العربية');
            context.locale = const Locale('ar');
            MagicRouter.navigateAndPopAll(const SplashScreen());
          }

        },
        onSaved: widget.onSave,
        //validator: widget.validator,
      ),
    );
  }
}
