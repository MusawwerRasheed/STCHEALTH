import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_health/Data/DataSource/Static/assets.dart';
import 'package:stc_health/Data/DataSource/Static/strings.dart';
import 'package:stc_health/Data/DataSource/Static/text_styles.dart';
import 'package:stc_health/Domain/Models/product_model.dart';
import 'package:stc_health/Presentation/Common/button.dart';
 

class SingleProductDetails extends StatefulWidget {

   final String? imageurl;
   final String? description;
   final num? price;
   final Rating rate;

  const SingleProductDetails({super.key, this.imageurl, this.price, this.description , required this.rate});  

  @override
  _SingleProductDetailsState createState() => _SingleProductDetailsState();
}

class _SingleProductDetailsState extends State<SingleProductDetails> {

  double container1Height = 450.h;
  double container2Height = 300.h;
  double minHeight = 130.h;  
  double maxHeight = 450.h;  


  void _updateContainerSize(double delta) {
    
    setState(() {
      container1Height = (container1Height + delta).clamp(minHeight, maxHeight);
      container2Height = (container2Height - delta).clamp(minHeight, maxHeight);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              _updateContainerSize(details.primaryDelta!);
            },
            child: 
            AnimatedContainer(
  duration: Duration(milliseconds: 100),
  height: container1Height,
  color: Colors.blue,
  child: Stack(
    children: [
      Positioned.fill(
        child: Image.network(
          widget.imageurl!, 
          fit: BoxFit.cover, // Use BoxFit.cover to fill the entire space
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(Assets.BackArrow),
            ),
            SvgPicture.asset(Assets.MenuIcon),
          ],
        ),
      ),
      Positioned(
        top: 50.0,
        left: 10.0,
        child: Text(
          'Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  ),
)
          ),
          GestureDetector(
            onVerticalDragUpdate: (details) {
              _updateContainerSize(details.primaryDelta!);
            },
            child:  AnimatedContainer(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              duration: Duration(seconds: 2),
              child: 
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:(){
                           _updateContainerSize(50.h);
                          }, 
                          child: IconButton(
                            icon: const Icon(
                            color: Colors.blue, 
                            Icons.arrow_upward_rounded ),
                            onPressed: () {
                            },
                          ),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 4,
                                      blurRadius: 4,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                
                                child: Padding(

                                  padding: EdgeInsets.all(18.sp),
                                  child: SvgPicture.asset(
                                    Assets.share,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 40.w,
                            ),
                            CustomButton(
                                buttonwidth: 240.w,
                                buttonheight: 50.h,
                                text: Strings.OrderNow,
                                onPressed: () {})
                          ],
                        ),
                        SizedBox(height: 10.h,),
                         SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                           child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                               widget.description!, 
                              style: Styles.openSansRegular(context, fontSize: 12.sp, 
                              color:Color.fromARGB(255, 146, 137, 137) ),
                            ),
                                                   ),
                         ),
                        SizedBox(
                          height: 10.h,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //  color: Colors.grey,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                               borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( "Reviews(${widget.rate.count})"),
                                Row(
                                  children: [
                                     Text(
                                      widget.rate.rate.toString(),
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 90.w,
                                    ),
                                    Row(
                                      children: List.generate(
                                        widget.rate.rate.toInt(),
                                        (index) => const Icon(Icons.star,
                                            color: Colors.yellow),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
       ]));
                }
              }
 












                               // flexible containers
 
  

 