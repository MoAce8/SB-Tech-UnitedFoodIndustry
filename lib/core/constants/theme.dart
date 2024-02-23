import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';

ThemeData themeData = ThemeData(
  primaryColor: buttonColor,
  primarySwatch: Colors.brown,
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.white,
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(
          color: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? kMainColor
                : colorLightGrey,
          ),
          width: 4),
    ),
    dayPeriodBorderSide: BorderSide(
      color: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? Colors.transparent
            : colorLightGrey,
      ),
    ),
    dayPeriodColor: MaterialStateColor.resolveWith(
      (states) =>
          states.contains(MaterialState.selected) ? kMainColor : Colors.white,
    ),
    dayPeriodTextColor: MaterialStateColor.resolveWith(
      (states) =>
          states.contains(MaterialState.selected) ? Colors.white : Colors.black,
    ),
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: kMainColor, width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith(
      (states) =>
          states.contains(MaterialState.selected) ? kMainColor : Colors.black87,
    ),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? Colors.white
          : Colors.black87,
    ),
    dialHandColor: Colors.blueGrey.shade700,
    dialBackgroundColor: Colors.blueGrey.shade800,
    hourMinuteTextStyle:
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    dayPeriodTextStyle:
        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
        borderSide: BorderSide(color: kMainColor),
      ),
      contentPadding: const EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? kMainColor : Colors.white),
    entryModeIconColor: kMainColor,
  ),
  fontFamily: "Cairo",
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.white),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(background: Colors.white),
);
