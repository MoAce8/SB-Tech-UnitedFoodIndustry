import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/product_details/product_details_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/data/product_model.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/product_item_buttons.dart';

class ProductGridItem extends StatefulWidget {
  const ProductGridItem({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProductDetails(product: widget.product)));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.01,
            horizontal: screenWidth(context) * 0.004),
        child: Container(
          padding: EdgeInsets.all(screenWidth(context) * 0.035),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  widget.product.pic,
                  height: screenWidth(context) * 0.25,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: screenWidth(context) * 0.02,
              ),
              Text(
                widget.product.name,
                softWrap: true,
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: screenWidth(context) * 0.037,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 0.008,
              ),
              customText(
                context,
                widget.product.type,
              ),
              customText(context, widget.product.weight),
              SizedBox(
                height: screenHeight(context) * 0.008,
              ),
              customText(
                  context, '${widget.product.price} ${LocaleKeys.egp.tr()}'),
              SizedBox(
                height: screenHeight(context) * 0.008,
              ),
              ProductButtons(
                list: false,
              )
            ],
          ),
        ),
      ),
    );
  }

  Text customText(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textGrey,
        fontSize: screenWidth(context) * 0.027,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
