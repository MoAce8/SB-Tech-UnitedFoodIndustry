import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class MagicRouter {
  static BuildContext currentContext = navigatorKey.currentContext!;

  static Future<dynamic> navigateTo(Widget page) =>
      navigatorKey.currentState!.push(materialPageRoute(page));

  static Future<dynamic> navigateAndPopAll(Widget? page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        materialPageRoute(page!),
        (s) => false,
      );
  // PersistentNavBarNavigator.pushNewScreen(context,
  //             withNavBar: true,
  //             screen: const ManageTutorAppointmentScreen(
  //               fromHome: false,
  //             ));
  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          materialPageRoute(page), (route) => route.isFirst);
  static Future<dynamic> navigateAndPReplacement(Widget page) =>
      navigatorKey.currentState!.pushReplacement(
        materialPageRoute(page),
      );
  static void pop() => navigatorKey.currentState!.pop();

  static Route<dynamic> materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (s) => page);
}

Future<dynamic> navigateT0o({required Widget page , required context}) =>
      PersistentNavBarNavigator.pushNewScreen(context,
              withNavBar: true,
              screen: page);
