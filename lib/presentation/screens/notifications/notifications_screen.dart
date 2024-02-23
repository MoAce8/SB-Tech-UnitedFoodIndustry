import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/notifications/notifications_item.dart';
import 'package:unitedfoodindustery/presentation/widget/drawer_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  final bool noNotifications = true;

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      title: LocaleKeys.notification.tr(),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.01,
            horizontal: screenWidth(context) * 0.08),
        child: noNotifications
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/images/noNotificationIcon@2x.png',height: screenHeight(context)*0.2,),
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    Text(
                      LocaleKeys.no_results.tr(),
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context)*0.044
                      ),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                itemBuilder: (_, index) => NotificationsItem(),
                separatorBuilder: (_, index) => SizedBox(
                  height: screenHeight(context) * 0.02,
                ),
                itemCount: 8,
              ),
      ),
    );
  }
}
