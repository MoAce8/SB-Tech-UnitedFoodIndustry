import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';
import 'package:unitedfoodindustery/core/constants/constants.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/data/product_model.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/product_grid_item.dart';
import 'package:unitedfoodindustery/presentation/screens/select_product/product_list_item.dart';
import 'package:unitedfoodindustery/presentation/widget/page_scaffold.dart';

class SelectProductScreen extends StatefulWidget {
  SelectProductScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SelectProductScreen> createState() => _SelectProductScreenState();
}

class _SelectProductScreenState extends State<SelectProductScreen> {
  final List products = [
    ProductModel(
        name: 'مكسب طعم شوكولاتة',
        type: 'جركن 25 ك',
        weight: '25 KG',
        price: 500),
    ProductModel(
        name: 'مكسب طعم فانيليا',
        type: 'جركن 25 ك',
        weight: '25 KG',
        price: 500),
    ProductModel(
        name: 'مكسب طعم فراولة',
        type: 'جركن 25 ك',
        weight: '25 KG',
        price: 500),
    ProductModel(
        name: 'مكسب طعم مانجا', type: 'جركن 20 ك', weight: '20 KG', price: 500),
    ProductModel(
        name: 'مكسب طعم اناناس',
        type: 'جركن 25 ك',
        weight: '25 KG',
        price: 500),
    ProductModel(
        name: 'مكسب طعم شوكولاتة',
        type: 'جركن 10 ك',
        weight: '10 KG',
        price: 225),
  ];

  bool list = true;

  @override
  Widget build(BuildContext context) {

    return PageScaffold(
      title: widget.title,
      body: Container(
        color: AppColors.offWhite,
        padding: EdgeInsets.symmetric(
            vertical: screenHeight(context) * 0.025,
            horizontal: screenWidth(context) * 0.025),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIconConstraints: BoxConstraints(
                          maxHeight: screenHeight(context) * 0.04),
                      suffixIcon: Icon(
                        CupertinoIcons.search,
                        size: screenWidth(context) * 0.06,
                        color: AppColors.primaryBlue,
                      ),
                      isCollapsed: true,
                      contentPadding:
                          EdgeInsets.all(screenWidth(context) * 0.016),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.primaryBlue, width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth(context) * 0.05,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      list = !list;
                    });
                  },
                  child: Icon(
                    list? Icons.grid_view_rounded:CupertinoIcons.list_bullet,
                    color: AppColors.primaryBlue,
                    size: screenWidth(context) * 0.08,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight(context) * 0.04,
            ),
            Expanded(
              child: list? ListView.builder(
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ProductListItem(
                  product: products[index],
                ),
              ):GridView.builder(
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: screenHeight(context)*0.0,
                  crossAxisSpacing: screenWidth(context)*0.01,
                  childAspectRatio: 0.65
                ),
                itemBuilder: (context, index) => ProductGridItem(
                  product: products[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
