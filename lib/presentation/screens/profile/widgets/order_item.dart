import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/profile/data/order_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth(context) * 0.02),
      margin: EdgeInsets.only(top: screenHeight(context)*0.012),
      width: double.infinity,
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    order.name,
                    style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    '${LocaleKeys.order_number.tr()}: ${order.id}',
                    style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Container(
                width: screenWidth(context)*0.28,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      blurRadius: 6,
                    )
                  ],
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(screenWidth(context) * 0.015),
                child: Text(
                  order.status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: screenWidth(context) * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: screenHeight(context)*0.02,),
          Text(
            '${LocaleKeys.total_price.tr()}: ${order.price} ${LocaleKeys.egp.tr()}',
            style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: screenWidth(context) * 0.04,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
