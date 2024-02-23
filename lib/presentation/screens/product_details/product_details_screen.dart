import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/data/product_model.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/product_item_buttons.dart';
import 'package:unitedfoodindustery/presentation/widget/page_scaffold.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: widget.product.name,
      color: AppColors.offWhite,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.025,
            horizontal: screenWidth(context) * 0.085),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.product.pic),
            SizedBox(
              height: screenHeight(context) * 0.1,
            ),
            Text(
              '${widget.product.price} ${LocaleKeys.egp.tr()}',
              style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: screenWidth(context) * 0.05,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context) * 0.015,
            ),
            Text(
              widget.product.type,
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: screenWidth(context) * 0.04,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.015,
            ),
            Text(
              widget.product.weight,
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: screenWidth(context) * 0.04,
              ),
            ),
          ],
        ),
      ),
      bottom: Container(
        padding: EdgeInsets.all(screenWidth(context) * 0.05),
        color: AppColors.white,
        child: ProductButtons(list: true),
      ),
    );
  }
}
