import 'package:cflutter/utils/colors.dart';
import 'package:cflutter/widgets/big_text.dart';
import 'package:flutter/material.dart';



class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Colors.redAccent,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
          itemBuilder: (context, position){
          return _buildPageItem(position);
          }
      ),
    );
  }
}
Widget _buildPageItem(int index) {
  return Stack(
    children: [
      Container(
        height: 220,
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?Colors.black:Colors.green,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/image/food1.png"
                )
            )
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 140,
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,

          ),
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: 'Bitter Orange Taste'),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
