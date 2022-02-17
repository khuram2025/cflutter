import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({Key? key,

    this.overFlow = TextOverflow.ellipsis,
    this.size = 20,
    this.color = const Color(0xFF332d2b),
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(color: color, fontWeight: FontWeight.w400, fontFamily: 'Rboto', fontSize: size),

    );
  }
}
