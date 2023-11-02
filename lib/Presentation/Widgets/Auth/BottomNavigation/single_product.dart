import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stc_health/Data/DataSource/Static/assets.dart';
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Data/DataSource/Static/text_styles.dart';
import 'package:stc_health/Presentation/Common/app_text.dart';

class SmallImage extends StatefulWidget {
 final String? imageurl;
 final num? price;  

SmallImage( {
  this.imageurl, this.price,
    super.key,
  });

  @override
  State<SmallImage> createState() => _SmallImageState();
}

class _SmallImageState extends State<SmallImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(     
          child: 
          Image.network(widget.imageurl!),
        ),

     Positioned(
          top: 160.h,
          left: 200.w,
          child: SvgPicture.asset(Assets.Ratings),
        ),

        Positioned(
          top: 155.h,
          left: 20.w,
          child: AppText(widget.price.toString() , style: Styles.openSansBold(context, 
          color: Appcolors.primarycolor, fontSize: 20.sp),),
        ), 
      ],
    );
  }
}
