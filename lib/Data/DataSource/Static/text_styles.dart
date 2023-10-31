import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:flutter/material.dart';

extension Scale on BuildContext {
 double get textScale => MediaQuery.of(this).textScaleFactor;
}


class Styles {
    static double _textScale(
    BuildContext context,
  ){
    return MediaQuery.of(context).textScaleFactor > 1.0
        ? 0.9
        : MediaQuery.of(context).textScaleFactor;     
  }

  static TextStyle openSansBold(BuildContext context,
  
      {double? fontSize, Color? color,FontWeight? fontWeight, FontStyle? fontStyle, 
      TextAlign? textalign, }) {
    return 
    TextStyle(
      fontStyle: fontStyle,
      fontSize: fontSize,
      color: color ?? Appcolors.darkblue,
      fontFamily: "OpenSans Bold",
      fontWeight: fontWeight?? FontWeight.normal,
    );
  }



  static TextStyle openSansRegular(BuildContext context,
      {double? fontSize, Decoration? decoration,   Color? color, FontStyle? fontstyle,
      double height = 1.4,FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle

    (  
      color: color ?? Appcolors.darkblue, fontStyle: fontstyle, 
      fontSize: fontSize,
      fontFamily: "OpenSans Regular",
      height: height,
      fontWeight: fontWeight,
    );
    
    }    
 }
