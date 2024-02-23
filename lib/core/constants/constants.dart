// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unitedfoodindustery/core/widgets/custom_buttons_widget.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import '../widgets/space_widget.dart';
import 'colors.dart';

const kLogo = 'asset/images/logo.png';
const kHomeLayout = '/';
TextStyle headingStyle = TextStyle(
  fontFamily: "Cairo", //'(A) Arslan Wessam A (A) Arslan Wessam A'
  fontSize: 16,
  color: colordeepGrey,
);
const String kDateFormatDMY = 'dd/MM/yyyy';

const String kReservationFormat = 'EEEE d MMMM';

const String kNullUserId = "00000000-0000-0000-0000-000000000000";

//////////////////////////////////////////////////

Widget logoImage() {
  return Center(
    child: Image.asset(kLogo),
  );
}
//////////////////////////////////////////////////

appbarNoTitle() {
  return AppBar(
    toolbarHeight: 0.0,
    elevation: 0.0,
  );
}

/////////////////////////////////////////////////

late SharedPreferences prefs;

Future startShared() async {
  prefs = await SharedPreferences.getInstance();
}

//////////////////////////////////////////////////////////
String translateString(String english, String arabic) {
  return prefs.getString("lang") == 'en' ? english : arabic;
}

////////////////////////////////////////////////////////////

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

///////////////////////////////////////////////////////////

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}
double sizeFromHeight(BuildContext context, double fraction, {bool hasAppBar = false}) {
  final screenHeight = MediaQuery.of(context).size.height;
  final calculateHeight = (hasAppBar
      ? (screenHeight -
      AppBar().preferredSize.height -
      MediaQuery.of(context).padding.top)
      : screenHeight) /
      fraction;
  return calculateHeight;
}
double sizeFromWidth(BuildContext context, double fraction) {
  final calculateWidth = MediaQuery.of(context).size.width / fraction;
  return calculateWidth;
}

void showTopToast({required BuildContext context, required String message,required String state}) {

  showTopSnackBar(
    Overlay.of(context),
    state=='SUCCESS'?
    CustomSnackBar.success(
      message: message,
      backgroundColor: Colors.green,
    ):
    state=='ERROR'?
    CustomSnackBar.error(
      message: message,
      backgroundColor: Colors.red,
    ):
    CustomSnackBar.info(
      message: message,
      backgroundColor: Colors.yellow,
    ),
  );
}

///////////////////////////////////////////////////////////
customAppbar({
  required String title,
  required context,
  VoidCallback? ontap,
}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: MazzoonColor,
    centerTitle: false,
    automaticallyImplyLeading: false,
    iconTheme: IconThemeData(color: Colorblack),
    title: Text(
      title,
      style: headingStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * 0.055),
    ),
    leading: InkWell(
      onTap: ontap ?? () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: screenWidth(context) * 0.055,
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////
dividerWidget() {
  return Divider(
    color: divdercolor,
    height: 1,
    thickness: 1,
  );
}
const kProfilePicturesFolder = 'ProfilePictures';
////////////////////////////////////////////////////////////////////
customAppBarLayout({required context, required String title}) {
  return PreferredSize(
      preferredSize: Size(screenWidth(context), 90),
      child: Container(
        padding: EdgeInsets.only(
            top: screenHeight(context) * 0.06,
            right: screenWidth(context) * 0.03),
        width: screenWidth(context),
        height: screenHeight(context) * 0.13,
        color: const Color(0xffF0F0F0),
        child: Text(
          title,
          style: headingStyle.copyWith(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.w400),
        ),
      ));
}

//////////////////////////////////////////////////////////////////////
customCachedNetworkImage({required String url, required context, BoxFit? fit}) {
  try {
    // ignore: unnecessary_null_comparison
    if (url == null || url == "") {
      return const Icon(
        Icons.error,
        color: Colors.white,
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => Icon(
                      Icons.error,
                      color: colorGrey,
                    ),
                errorWidget: (context, url, error) {
                  return const Icon(
                    Icons.error,
                    color: Colors.white,
                  );
                })
            : Image.asset(
                "asset/icons/app_logo.png",
                width: screenWidth(context) * 0.2,
                fit: BoxFit.contain,
              ),
      );
    }
  } catch (e) {
    print(e.toString());
  }
}

///////////////////////////////////////////////////////////////////

Widget loading(Color color) {
  return Center(
    child: CircularProgressIndicator(
      color: color,
    ),
  );
}

///////////////////////////////////////////////////////////////////
void dialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Opacity(
        opacity: 0.8,
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          color: Colors.black12,
          child: Center(
            child: CircularProgressIndicator(
              color: mal3abColor,
            ),
          ),
        ),
      );
    },
  );
}

void dialogMsg({
  required context,
  required void Function() onTap,
  required String subTitle,
  bool? isCongrate,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding:
            EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.032),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth(context) * 0.04)),
        title: Column(
          children: [
            (isCongrate == true)
                ? Text(
                    translateString('Congrautions', "تهانينا"),
                    textAlign: TextAlign.center,
                    style: headingStyle.copyWith(
                        color: const Color(0xff4D4D4D),
                        fontSize: 16,
                        // height: 2,
                        fontWeight: FontWeight.w700),
                  )
                : const SizedBox(),
            const VerticalSpace(value: 1),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                subTitle,
                // "تم تعديل كلمة المرور بنجاح",
                textAlign: TextAlign.center,
                style: headingStyle.copyWith(
                    color: const Color(0xff4D4D4D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const VerticalSpace(value: 3),
            CustomGeneralButton(
              width: screenWidth(context) * 0.5,
              text: LocaleKeys.ok.tr(),
              height: 45,
              textColor: Colors.white,
              // borderColor: MazzoonColor,
              fontSize: 15,
              onTap: onTap,
              color: buttonColor,
              borderRadius: 10,
            ),
          ],
        ),
      );
    },
  );
}

// String parseHtmlString(String htmlString) {
//   final document = parse(htmlString);
//   final String parsedString = parse(document.body!.text).documentElement!.text;
//   return parsedString;
// }

///////////////////////////////////////////////////////////////////////////////////

