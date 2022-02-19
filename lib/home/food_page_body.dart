import 'package:cflutter/utils/colors.dart';
import 'package:cflutter/widgets/big_text.dart';
import 'package:cflutter/widgets/icon_text.dart';
import 'package:cflutter/widgets/small_text.dart';
import 'package:flutter/material.dart';



class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print("Current Value is " +_currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      // color: Colors.redAccent,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
          itemBuilder: (context, position){
          return _buildPageItem(position);
          }
      ),
    );
  }
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currentPageValue.floor()){
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index ==_currentPageValue.floor()+1){
      var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix =Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index ==_currentPageValue.floor()-1){
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix =Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven?Colors.black:Colors.green,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/food0.png"
                    )
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
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
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.7"),
                        SizedBox(width: 10,),
                        SmallText(text: '1287'),
                        SizedBox(width: 5,),
                        SmallText(text: 'comments')
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp, iconcolor: AppColors.iconColor1, text: 'Normal', color: Colors.grey),
                        SizedBox(width: 15,),
                        IconAndTextWidget(icon: Icons.location_on, iconcolor: AppColors.mainColor, text: '1.7Km', color: Colors.grey),
                        SizedBox(width: 15,),
                        IconAndTextWidget(icon: Icons.access_time, iconcolor: AppColors.iconColor2, text: "20min", color: Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

