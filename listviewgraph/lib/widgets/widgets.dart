import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Text 사용
Widget textBold(String word, Color mainColor, TextAlign textAlign, double fontSize){
  return Text(
    word,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: mainColor,
    ),textAlign: textAlign
  );
}

Widget textNormal(String word, Color mainColor, TextAlign textAlign, double fontSize){
  return Text(
    word,
    style: TextStyle(
      fontSize: fontSize,
      color: mainColor,
    ),textAlign: textAlign,
  );
}



//Table 텍스트 사용
Widget tableLTextWidget(String word, double width, double height){
  return Container(
    width: width,
    height: height,
    child: Text(
      word,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 14.5,
        fontWeight: FontWeight.w100,
      ),
    ),
  );
}

Widget tableLBTextWidget(String word, double width, double height){
  return Container(
    width: width,
    height: height,
    child: Text(
      word,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 14.5,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget tableRTextWidget(String word, double width, double height){
  return Container(
      width: width,
      height: height,
      alignment: Alignment.centerRight,
      child: Text(
        word,
        style: const TextStyle(fontSize: 14.5,
            fontWeight: FontWeight.w100),)
  );
}