import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget{
  String? content;
  double? textSize;
  Color? color;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  int? maxLine;


  AppText({super.key, required this.content, this.textSize, this.color, this.fontWeight, this.fontStyle, this.maxLine });

  @override
  Widget build(BuildContext context) {
    return Text(content ?? "", style: TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: textSize ?? 16,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal
    ),
      overflow: maxLine != null ? TextOverflow.ellipsis : TextOverflow.visible,
      maxLines: maxLine ?? maxLine,
    );
    // TODO: implement build
    throw UnimplementedError();
  }



}