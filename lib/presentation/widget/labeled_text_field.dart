import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';


class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.suffix,
    this.obscure = false,
    this.keyboard,
    this.validator, this.inputFormatters, this.denySpaces= false, this.onChanged,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final Function(String? s)? onChanged;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatters;
  final bool denySpaces;
  final String? Function(String? st)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(
          color: AppColors.textGrey,
          fontSize: screenWidth(context)* 0.04,
        ),),
        SizedBox(height: screenHeight(context)*0.004,),
        TextFormField(
          inputFormatters: inputFormatters ?? [],
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboard,
          validator: validator,
          onChanged: onChanged,
          style: TextStyle(
              fontSize: screenWidth(context)*0.05
          ),
          decoration: InputDecoration(
              isDense: true,
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.textGrey
                  )
              ),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: suffix,
              suffixIconColor: AppColors.blue,
              suffixIconConstraints: BoxConstraints(maxHeight: screenHeight(context)*0.04)
          ),
        ),
      ],
    );
  }
}

