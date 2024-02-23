import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/product_details/product_details_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/data/product_model.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/product_item_buttons.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
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
          padding: EdgeInsets.all(screenWidth(context) * 0.06),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Image.asset(
                widget.product.pic,
                height: screenWidth(context) * 0.35,
                width: screenWidth(context) * 0.3,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: screenWidth(context) * 0.02,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: screenWidth(context) * 0.044,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(context,widget.product.type,),
                        customText(context, '${widget.product.price} ${LocaleKeys.egp.tr()}'),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.01,
                    ),
                    customText(context, widget.product.weight),
                    SizedBox(
                      height: screenHeight(context) * 0.01,
                    ),
                    ProductButtons(list: true,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text customText(BuildContext context,String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textGrey,
        fontSize: screenWidth(context) * 0.033,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
