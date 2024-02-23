import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/clients/client_list_item.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/client_model.dart';

class ClientsScreen extends StatelessWidget {
  ClientsScreen({Key? key}) : super(key: key);

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
    ClientModel(
        pic: 'asset/images/ic_loading.png',
        name: 'Mohammed',
        phone: '01090858070'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.offWhite,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: screenHeight(context) * 0.03,
        right: screenWidth(context) * 0.045,
        left: screenWidth(context) * 0.045,
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              suffixIconConstraints:
                  BoxConstraints(maxHeight: screenHeight(context) * 0.04),
              suffixIcon: Icon(
                CupertinoIcons.search,
                size: screenWidth(context) * 0.06,
                color: AppColors.primaryBlue,
              ),
              isCollapsed: true,
              contentPadding: EdgeInsets.all(screenWidth(context) * 0.016),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryBlue,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryBlue, width: 1),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.04,
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) =>
                  ClientListItem(client: clients[index]),
              itemCount: clients.length,
            ),
          )
        ],
      ),
    );
  }
}
