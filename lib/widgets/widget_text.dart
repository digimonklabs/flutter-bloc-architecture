import 'package:flutter/material.dart';

class WidgetText{

  static Widget widgetRobotoRegularText(
      String title,
      Color color,
      double textSize, {
        TextAlign align = TextAlign.start,
        decoration = TextDecoration.none,
      }) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontSize: textSize,
          fontWeight: FontWeight.normal,
          decoration: decoration),
      textAlign: align,
    );
  }

  static Widget widgetPoppinsMaxLineOverflowText(
      String title,
      Color color,
      double textSize, {
        int maxline = 1,
        TextAlign align = TextAlign.start,
        decoration= TextDecoration.none,
      }) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline,
      style: TextStyle(
          color: color,
          fontSize: textSize,
          fontWeight: FontWeight.bold,
          decoration: decoration),
      textAlign: align,
    );
  }


  static Widget widgetRegularOverflowText(
      String title,
      Color color,
      double textSize, {
        int maxline = 1,
        TextAlign align = TextAlign.start,
        decoration= TextDecoration.none,
      }) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline,
      style: TextStyle(
          color: color,
          fontSize: textSize,
          fontWeight: FontWeight.normal,
          decoration: decoration),
      textAlign: align,
    );
  }
}