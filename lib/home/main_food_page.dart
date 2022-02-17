import 'package:cflutter/home/food_page_body.dart';
import 'package:cflutter/utils/colors.dart';
import 'package:cflutter/widgets/big_text.dart';
import 'package:cflutter/widgets/small_text.dart';
import 'package:flutter/material.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 15),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: 'Pakistan', color: AppColors.mainColor, size: 25,),
                          Row(
                            children: [
                              SmallText(text: 'Jhang', color: Colors.black54,),
                              Icon(Icons.arrow_drop_down_rounded),
                            ],
                          )

                        ],
                      ),
                      Center(
                        child: Container(
                          height: 45,
                          width: 45,
                          child: Icon(Icons.search, color: Colors.white,),
                          decoration: BoxDecoration(
                              color: Colors.green,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
