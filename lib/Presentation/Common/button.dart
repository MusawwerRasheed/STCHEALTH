import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
 

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? buttonheight;
  final double? buttonwidth;

   CustomButton({
    this.buttonheight,
    this.buttonwidth,  
    Key? key,
    required this.text,
    required this.onPressed,
  }) 
  :
  super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return Container( 
      width: buttonwidth ?? 300.w, height: buttonheight?? 70.h, 
      child: ElevatedButton(
        
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Appcolors.lightblue,
          
           
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), // Set border radius
          ),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Adjust padding
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 13.sp, color: Colors.white),
        ),
      ),
    );
  }
}
