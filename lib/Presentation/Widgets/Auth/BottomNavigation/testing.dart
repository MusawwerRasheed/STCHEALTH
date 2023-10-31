import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health/Data/DataSource/Static/assets.dart';
 


class Testing extends StatefulWidget {
 
  @override
  State<Testing> createState() => _TestingState();
  
}

class _TestingState extends State<Testing> {
  
  
  String selectedShape = 'Circle';
  Color selectedColor = Colors.red;

  void changeShape(String shape) {
    setState(() {
      selectedShape = shape;
    });
  }

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => changeShape('Circle'),
                          child: Text('Circle'),
                        ),
                        ElevatedButton(
                          onPressed: () => changeShape('Triangle'),
                          child: Text('Triangle'),
                        ),
                        ElevatedButton(
                          onPressed: () => changeShape('Rectangle'),
                          child: Text('Rectangle'),
                        ),
                      ],
                    ),
                    Container(
                      width: 310.w,
                      height: 310.h,
                      child: _buildShape(selectedShape),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => changeColor(Colors.red),
                          child: Text('Red'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: () => changeColor(Colors.green),
                            child: Text('Green'),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => changeColor(Colors.blue),
                          child: Text('Blue'),
                        ),
                      ],
                    ),
                 
                // horizontal scrolling cards

                 
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      
                        child: Container(height: 200.h,
                          child: Row(children: [ 
                          Container(child: Card(child: Image.asset(Assets.ShoesSmall),),), 
                          Container(child: Card(child: Image.asset(Assets.ShirtSmall)),), 
                          Container(child: Card(child: Image.asset(Assets.ShoesBig)),), 
                          
                          ],),
                        ),
                    ),
                 SizedBox(height: 10.h,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShape(String shape) {
    if (shape == 'Circle') {
      return Card(
        color: selectedColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(155.h),
        ),
      );
    } else if (shape == 'Triangle') {
      return CustomPaint(
        size: Size(310.w, 310.h),
        painter: TrianglePainter(selectedColor),
      );
    } else if (shape == 'Rectangle') {
      return Card(
        color: selectedColor,
      );
    }
    return Container();
  }
}



class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  






}
