// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.isPassword,
    this.hintColor,
    this.inputType,
    this.onChanged,
    this.inputFormatters,
    this.onSaved,
    this.focusNode,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.borderSideColor,
    this.borderSideColor2,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.fillColor,
    this.errorTextColor,
    this.hint,
    this.validator,
    // this.isLTR,
    this.readOnly,
    this.ontap,
  }) : super(key: key);
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final Function(String? s)? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? label;
  final String? hint;
  final bool? isPassword;
  final bool? readOnly;
  final VoidCallback? ontap;
  final Widget? suffix;
  final Widget? prefix;
  final Color? hintColor;
  final Color? errorTextColor;
  final Color? borderSideColor;
  final Color? borderSideColor2;

  final Color? fillColor;
  // final bool? isLTR;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      inputFormatters: inputFormatters ?? [],
      textAlign: TextAlign.start,
      validator: validator,
      readOnly: readOnly ?? false,
      onTap: ontap,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      style: headingStyle.copyWith(color: colordeepGrey, fontSize: 20),
      onEditingComplete: onEditingComplete,
      cursorColor: Colors.grey.shade400,
      // showCursor: false,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelStyle: headingStyle.copyWith(color: hintColor, fontSize: 16),
        labelText: label,
        contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        hintText: hint,
        errorStyle: headingStyle.copyWith(
            color: errorTextColor ?? Colors.red,
            fontSize: screenWidth(context) * 0.035),
        hintStyle: headingStyle.copyWith(
            color: hintColor ?? mal3abColor,
            //  colordeepGrey.withOpacity(0.3),
            fontSize: 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: borderSideColor2 ?? buttonColor,
          ),
        ),
        suffixIcon: suffix ?? null,
        prefixIcon: prefix,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: borderSideColor ?? colorBorder.withOpacity(0.4)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: colorBorder.withOpacity(0.4)),
        ),
      ),
    );
  }
}
