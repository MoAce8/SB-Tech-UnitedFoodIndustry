import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/generator/locale_keys.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/home/clients_item.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/client_model.dart';
import 'package:unitedfoodindustery/presentation/screens/profile/data/date_order_model.dart';
import 'package:unitedfoodindustery/presentation/screens/profile/data/order_model.dart';
import 'package:unitedfoodindustery/presentation/screens/profile/widgets/date_order_item.dart';
import 'package:unitedfoodindustery/presentation/screens/profile/widgets/order_item.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    ClientModel(
        pic: 'asset/images/ic_loading.png',
        name: 'Mohammed',
        phone: '01090858070'),
    ClientModel(
        pic: 'asset/images/ic_loading.png',
        name: 'Mohammed',
        phone: '01090858070'),
  ];

  List dates = [
    DateOrderModel(date: '31/10/2023', orders: [
      OrderModel(
          id: '6591',
          name: 'PC',
          price: 25500,
          status: LocaleKeys.delivering.tr()),
      OrderModel(
          id: '6592',
          name: 'Playstation',
          price: 35000,
          status: LocaleKeys.completed.tr()),
      OrderModel(
          id: '6593',
          name: 'Snacks',
          price: 105.75,
          status: LocaleKeys.completed.tr()),
    ]),
    DateOrderModel(date: '01/11/2023', orders: [
      OrderModel(
          id: '6574',
          name: 'Playstation',
          price: 35000,
          status: LocaleKeys.completed.tr()),
      OrderModel(
          id: '6575',
          name: 'PC',
          price: 25500,
          status: LocaleKeys.delivering.tr()),
      OrderModel(
          id: '6576',
          name: 'Shoes',
          price: 1300,
          status: LocaleKeys.canceled.tr()),
      OrderModel(
          id: '6577',
          name: 'Snacks',
          price: 105.75,
          status: LocaleKeys.completed.tr()),
    ]),
    DateOrderModel(date: '02/11/2023', orders: [
      OrderModel(
          id: '6591',
          name: 'PC',
          price: 25500,
          status: LocaleKeys.delivering.tr()),
      OrderModel(
          id: '6592',
          name: 'Playstation',
          price: 35000,
          status: LocaleKeys.completed.tr()),
      OrderModel(
          id: '6593',
          name: 'Snacks',
          price: 105.75,
          status: LocaleKeys.completed.tr()),
    ]),
    DateOrderModel(date: '03/11/2023', orders: [
      OrderModel(
          id: '6574',
          name: 'Playstation',
          price: 35000,
          status: LocaleKeys.completed.tr()),
      OrderModel(
          id: '6575',
          name: 'PC',
          price: 25500,
          status: LocaleKeys.delivering.tr()),
      OrderModel(
          id: '6576',
          name: 'Shoes',
          price: 1300,
          status: LocaleKeys.canceled.tr()),
      OrderModel(
          id: '6577',
          name: 'Snacks',
          price: 105.75,
          status: LocaleKeys.completed.tr()),
    ]),
  ];

  String activeDate = '';

  List orders = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.025,
          right: screenWidth(context) * 0.045,
          left: screenWidth(context) * 0.045,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CircleAvatar(
                      radius: screenWidth(context) * 0.14,
                      backgroundImage: AssetImage(
                        'asset/images/ic_loading.png',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: screenWidth(context) * 0.01,
                        right: screenWidth(context) * 0.01,
                      ),
                      child: CircleAvatar(
                        radius: screenWidth(context) * 0.03,
                        backgroundColor: AppColors.primaryBlue,
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.white,
                          size: screenWidth(context) * 0.046,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth(context) * 0.02,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohammed Tharwat',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: screenWidth(context) * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'mohammedtharwat21@gamil.com',
                            style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: screenWidth(context) * 0.03),
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.edit_outlined,
                              size: 16,
                              color: AppColors.primaryBlue,
                            ),
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.mobile_number.tr(),
                      style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: screenWidth(context) * 0.04),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.01,
                    ),
                    Text(
                      '01090858070',
                      style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: screenWidth(context) * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: AppColors.primaryBlue,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.012,
                  horizontal: screenWidth(context) * 0.015),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.Clients.tr(),
                    style: TextStyle(
                        color: AppColors.textDarkGrey,
                        fontSize: screenWidth(context) * 0.04),
                  ),
                  CarouselSlider(
                    items: clients
                        .map(
                          (e) =>
                          Container(
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
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context) * 0.012,
                  horizontal: screenWidth(context) * 0.015),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.orders.tr(),
                    style: TextStyle(
                        color: AppColors.textDarkGrey,
                        fontSize: screenWidth(context) * 0.04),
                  ),
                  CarouselSlider(
                    items: dates
                        .map(
                          (e) =>
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: DatedOrderItem(
                              date: e,
                              activeDate: activeDate,
                              onTab: () {
                                setState(() {
                                  activeDate = e.date;
                                  orders = e.orders;
                                });
                              },
                            ),
                          ),
                    )
                        .toList(),
                    options: CarouselOptions(
                      height: screenHeight(context) * 0.08,
                      disableCenter: true,
                      viewportFraction: 0.3,
                      enableInfiniteScroll: false,
                      padEnds: false,
                    ),
                  ),
                  Column(
                    children: [
                      for (final order in orders)
                        OrderItem(
                          order: order,
                        ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            Divider(color: AppColors.primaryBlue, thickness: 1,),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child: Row(
                children: [
                  Image.asset('asset/images/ic_menu_logout.png'),
                  SizedBox(width: screenWidth(context) * 0.01,),
                  Text(
                    LocaleKeys.logout.tr(),
                    style: TextStyle(
                        color: AppColors.red,
                        fontSize: screenWidth(context) * 0.04),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
