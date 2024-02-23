import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/brand_model.dart';
import 'package:unitedfoodindustery/presentation/screens/home/our_brand_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List brands = [
    BrandModel(
        pic: 'asset/images/ic_prod_5@3x.png', name: 'Cream'),
    BrandModel(
        pic: 'asset/images/ic_prod_1@3x.png', name: 'Cake'),
    BrandModel(
        pic: 'asset/images/ic_prod_3@3x.png', name: 'Milk Jam'),
    BrandModel(
        pic: 'asset/images/ic_prod_2@3x.png', name: 'Glass Exotic Glazes'),
    BrandModel(
        pic: 'asset/images/ic_prod_4@3x.png', name: 'ALFA Glaze'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.offWhite,
      padding: EdgeInsets.symmetric(
          vertical: screenHeight(context)*0.025,
          horizontal: screenWidth(context)*0.025
      ),
      child: GridView.builder(
        itemCount: brands.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: screenHeight(context)*0.005,
          crossAxisSpacing: screenWidth(context)*0.01,
        ),
        itemBuilder: (context, index) => BrandItem(
          brand: brands[index],
        ),
      ),
    );
  }
}
