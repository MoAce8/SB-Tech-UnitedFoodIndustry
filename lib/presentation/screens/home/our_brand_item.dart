import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/brand_model.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/select_product_screen.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({Key? key, required this.brand}) : super(key: key);

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectProductScreen(title: brand.name,)));
      },
      child: Container(
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(5)
        ),
        height: sizeFromHeight(context,6),
        width: sizeFromWidth(context, 6),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:screenWidth(context) * 0.03,left: screenWidth(context) * 0.03,right:screenWidth(context) * 0.03 ),
              height: screenHeight(context) * 0.16,
              width: screenWidth(context) * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.white,
              ),
              child: Image.asset(
                brand.pic,
              ),
            ),
            Container(
              height: sizeFromHeight(context,20),
              width: screenWidth(context) * 0.4,
              decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )
              ),
              child: SizedBox(
                width: sizeFromWidth(context, 6),
                child: Center(
                  child: Text(
                    brand.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.white,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(context)*0.04
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
