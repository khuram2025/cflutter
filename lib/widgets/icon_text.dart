import 'package:cflutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {

  final IconData icon;
  final Color iconcolor;
  final String text;
  final Color color;
  
  const IconAndTextWidget({Key? key, 
    required this.icon, 
    required this.iconcolor, 
    required this.text, 
    required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconcolor,),
        SizedBox(width: 5,),
        SmallText(text: text, color: color,)
        
      ],
      
    );
  }
}
