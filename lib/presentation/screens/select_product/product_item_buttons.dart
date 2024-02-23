import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/widget/amount_field.dart';

class ProductButtons extends StatefulWidget {
  const ProductButtons({Key? key, required this.list}) : super(key: key);

  final bool list;

  @override
  State<ProductButtons> createState() => _ProductButtonsState();
}

class _ProductButtonsState extends State<ProductButtons> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        gridOrList(
            onPress: () {
              setState(() {
                counter++;
              });
            },
            icon: Icons.add),
        SizedBox(
          width: screenWidth(context) * 0.01,
        ),
        AmountField(counter: counter),
        SizedBox(
          width: screenWidth(context) * 0.01,
        ),
        gridOrList(
            onPress: () {
              setState(() {
                if (counter > 1) counter--;
              });
            },
            icon: Icons.remove),
        const Spacer(),
        gridOrList(onPress: (){}, icon: CupertinoIcons.cart_fill),
      ],
    );
  }

  Widget gridOrList(
      {required void Function() onPress, required IconData icon}) {
    return widget.list
        ? FloatingActionButton.small(
            onPressed: onPress,
            child: Icon(icon),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppColors.primaryBlue,
          )
        : GestureDetector(
            onTap: onPress,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context)*0.01,
                vertical: screenHeight(context)*0.01
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.primaryBlue,
              ),
              child: Icon(icon,color: AppColors.white,),
            ),
          );
  }
}
