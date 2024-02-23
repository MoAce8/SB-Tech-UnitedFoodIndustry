import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/home/clients_item.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/brand_model.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/client_model.dart';
import 'package:unitedfoodindustery/presentation/screens/home/our_brand_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List brands = [
    BrandModel(
        pic: 'asset/images/ic_loading.png', name: 'المركز العربي الافريقي'),
  ];

  List clients = [
    ClientModel(
        pic: 'asset/images/ic_loading.png',
        name: 'Mohammed',
        phone: '01090858070'),
    ClientModel(
        pic: 'asset/images/ic_loading.png',
        name: 'Mohammed',
        phone: '01090858070'),
    ClientModel(
        pic: 'asset/images/ic_loading.png',
        name: 'Mohammed',
        phone: '01090858070'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: AppColors.offWhite,
        width: double.infinity,
        padding: EdgeInsets.only(
            right: screenWidth(context) * 0.05,
            left: screenWidth(context) * 0.05,
            top: screenHeight(context) * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'asset/images/ic_logo.png',
                width: screenWidth(context) * 0.53,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.05,
            ),
            Text(
              LocaleKeys.our_brands.tr(),
              style: TextStyle(
                  color: AppColors.textDarkGrey,
                  fontSize: screenWidth(context) * 0.044,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            CarouselSlider(
              items: brands
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(5),
                      child: BrandItem(brand: e),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: screenHeight(context) * 0.24,
                disableCenter: true,
                viewportFraction: 0.45,
                enableInfiniteScroll: false,
                padEnds: false,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.05,
            ),
            Text(
              LocaleKeys.your_clients.tr(),
              style: TextStyle(
                  color: AppColors.textDarkGrey,
                  fontSize: screenWidth(context) * 0.044,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            CarouselSlider(
              items: clients
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(5),
                      child: ClientItem(client: e),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: screenHeight(context) * 0.19,
                disableCenter: true,
                viewportFraction: 0.38,
                enableInfiniteScroll: false,
                padEnds: false,
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
