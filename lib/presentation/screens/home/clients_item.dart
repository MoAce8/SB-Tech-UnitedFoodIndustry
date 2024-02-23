import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/clien_details/client_details_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/home/data/client_model.dart';

class ClientItem extends StatelessWidget {
  const ClientItem({Key? key, required this.client}) : super(key: key);

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => ClientDetailsScreen(client: client)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
        ),
        height: screenHeight(context) * 0.17,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth(context) * 0.03),
              height: screenHeight(context) * 0.14,
              width: screenWidth(context) * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.white,
              ),
              child: Image.asset(
                client.pic,
              ),
            ),
            Container(
              height: screenHeight(context) * 0.03,
              width: screenWidth(context) * 0.3,
              decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )
              ),
              child: Center(
                child: Text(
                  client.name,
                  style: TextStyle(
                      color: AppColors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(context) * 0.04
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
