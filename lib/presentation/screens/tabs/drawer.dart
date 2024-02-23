import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/about_us/about_us_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/notifications/notifications_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/settings/settings_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/tabs/tabs_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/wallet/wallet_screen.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: AppColors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'asset/images/ic_logo.png',
            ),
          ),
          BuildListTile(
            icon: Icons.home,
            title: LocaleKeys.home.tr(),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const TabsScreen()));
            },
          ),
          BuildListTile(
            icon: Icons.account_balance_wallet,
            title: LocaleKeys.wallet.tr(),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const WalletScreen()));
            },
          ),
          BuildListTile(
            icon: Icons.notifications,
            title: LocaleKeys.notification.tr(),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const NotificationsScreen()));
            },
          ),
          BuildListTile(
            icon: Icons.settings,
            title: LocaleKeys.settings.tr(),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
            },
          ),
          BuildListTile(
            icon: Icons.phone_in_talk,
            title: LocaleKeys.contact_us.tr(),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ContactUsScreen()));
            },
          ),
          BuildListTile(
            icon: Icons.person_add_alt_1,
            title: LocaleKeys.about_us.tr(),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const AboutUsScreen()));
            },
          ),
          const Spacer(),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) * 0.055,
            ),
            leading: const Icon(Icons.logout),
            textColor: AppColors.red,
            iconColor: AppColors.red,
            title: Text(
              LocaleKeys.logout.tr(),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
          ),
          SizedBox(
            height: screenHeight(context) * 0.05,
          )
        ],
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  const BuildListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.055,
      ),
      leading: Icon(icon),
      textColor: AppColors.primaryBlue,
      iconColor: AppColors.primaryBlue,
      title: Text(title),
      onTap: onTap,
    );
  }
}
