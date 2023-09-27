import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Data/DataSource/Static/strings.dart';
import 'package:stc_health/Presentation/Common/app_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Column(children: [ 
        
         Container(width: MediaQuery.of(context).size.width,
         height: 350.h,
          decoration: BoxDecoration(
        
        gradient: LinearGradient(
                colors: [Appcolors.darkblue, Appcolors.lightblue], // You can add more colors if needed
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),

         ),
         
         child: Column( children: [
          
          Column( 
            children: [AppText(Strings.Login, style: TextStyle(color: Appcolors.primarycolor),)],
      
          ),
          
          Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [AppText(Strings.Login, style: TextStyle(color: Appcolors.primarycolor),)],
      
          ),
          ],),
         
         ), 

       

      ],
      
      ),

    );
  }
}