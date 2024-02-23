validateName(String value) {
  if (value.isEmpty) {
    return 'يرجي ادخال اسم المستخدم';
  } else {
    if (value.length < 3 || value.length >= 18) {
      return 'Name Between 3 To 18 Charaters';
    }
  }
  return null;
}

validate(String value) {
  if (value.isEmpty) {
    return "هذا الحقل مطلوب";
  }
  return null;
}
validateRestPassword(String value) {
  String atLeastOneUpper = r'^(?=.*[A-Z])';
  String atLeastOneLower = r'^(?=.*[a-z])';
  String atLeastOneDigit = r'^(?=.*?[0-9])';
  String atLeastOneSpecial = r'^(?=.*?[!@#\$&*~?%^])';
  String lengthPattern = r'^.{8,}';

  if (value.isEmpty) {
    return "الرجاء إدخال كلمة السر الحاليه";
  }
  else if (!RegExp(lengthPattern).hasMatch(value)) {
    return "الرجاء إدخال كلمة السر الصحيحة";
  }
  else if (!RegExp(atLeastOneUpper).hasMatch(value)) {
    return 'الرجاء إدخال كلمة السر الصحيحة';
  }
  else if(!RegExp(atLeastOneLower).hasMatch(value)){
    return 'الرجاء إدخال كلمة السر الصحيحة';
  }
  else if(!RegExp(atLeastOneDigit).hasMatch(value)){
    return 'الرجاء إدخال كلمة السر الصحيحة';
  }
  else if(!RegExp(atLeastOneSpecial).hasMatch(value)){
    return 'الرجاء إدخال كلمة السر الصحيحة';
  }
  return null;
}
String? validateOtpCode(String? code){
  if(code == null || code.isEmpty){
    return 'من فضلك ادخل الرمز التوثيقي';
  }
  else if(code.length < 6){
    return 'الرمز التوثيقي يجب ان يكون 6 ارقام';
  }
  return null;
}

validatePassword(String value) {
  String atLeastOneUpper = r'^(?=.*[A-Z])';
  String atLeastOneLower = r'^(?=.*[a-z])';
  String atLeastOneDigit = r'^(?=.*?[0-9])';
  String atLeastOneSpecial = r'^(?=.*?[!@#\$&*~?%^])';
  String lengthPattern = r'^.{8,}';

  if (!RegExp(lengthPattern).hasMatch(value)) {
    return "يجب أن يكون طوله 8 أحرف على الأقل";
  }
  else if (!RegExp(atLeastOneUpper).hasMatch(value)) {
    return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
  }
  else if(!RegExp(atLeastOneLower).hasMatch(value)){
    return 'يجب أن تحتوي على حالة صغيرة واحدة على الأقل';
  }
  else if(!RegExp(atLeastOneDigit).hasMatch(value)){
    return 'يجب أن تحتوي على رقم واحد على الأقل';
  }
  else if(!RegExp(atLeastOneSpecial).hasMatch(value)){
    return 'يجب أن تحتوي على حرف خاص واحد على الأقل';
  }
  return null;
}

validateConfirmPassword(String value, String confirm) {
  if (value != confirm) {
    return 'يجب ان تكونا كلمتا المرور متطابقتين';
  }
  return null;
}

validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return "أدخل البريد الالكتروني الصحيح";
  } else {
    return null;
  }
}
validateMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return "رقم الجوال مطلوب";
  } else if (value.length != 11) {
    return "رقم الجوال يجب ان يكون 11 رقم";
  } else if (!value.startsWith('01')) {
    return "رقم الجوال يبدأ ب 01";
  }
  else if(!regExp.hasMatch(value)){
    return 'رقم الهاتف غير صحيح';
  }
  return null;
}
// validateMobile(String value) {
//   String pattern = r'(^[0-9]*$)';
//   RegExp regExp = RegExp(pattern);
//   if (value.isEmpty) {
//     return "رقم الجوال مطلوب";
//   }
//   else if(!regExp.hasMatch(value)){
//     return 'رقم الهاتف غير صحيح';
//   }
//   return null;
// }
