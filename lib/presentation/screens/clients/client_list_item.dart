import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/clien_details/client_details_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/client_model.dart';
import 'package:unitedfoodindustery/presentation/widget/app_button.dart';

class ClientListItem extends StatelessWidget {
  const ClientListItem({Key? key, required this.client}) : super(key: key);

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.01,
          horizontal: screenWidth(context) * 0.004),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.15),
              blurRadius: 6,
            )
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Image.asset(
              client.pic,
              height: screenHeight(context) * 0.17,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(screenWidth(context) * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client.name,
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(context) * 0.044,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.01,
                    ),
                    Text(
                      client.phone,
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context) * 0.033,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                            title: LocaleKeys.view_client.tr(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ClientDetailsScreen(client: client)));
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
