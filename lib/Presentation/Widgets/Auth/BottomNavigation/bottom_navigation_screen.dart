import 'package:flutter/material.dart';
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Data/DataSource/Static/text_styles.dart';
import 'package:stc_health/Presentation/Widgets/Auth/BottomNavigation/all_products.dart';

 



class BottomNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80))),
        backgroundColor: Appcolors.lightgrey,
        title: Center(child: Text('All Products', style: Styles.openSansBold(context, color: Colors.black) ,)),
),

      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(  
 
         unselectedItemColor: Appcolors.lightgrey, 
        selectedItemColor: Colors.lightBlue.shade300,       
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_sharp ,  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,  ),
           label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,  ),
      label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return Container(
          // color: Colors.pink,
            child:
            AllProductsPage(), 
            //  Center(child: Text('serhdi'),
            // )
        );
      case 1:
        return Container(
          color: Colors.green,
          child: Center(
            child: Text('Search Container'),
          ),
        );
      case 2:
        return Container(
          color: Colors.red,
          child: Center(
            child: Text('Favorites Container'),
          ),
        );
      case 3:
        return Container(
          color: Colors.orange,
          child: Center(
            child: Text('Profile Container'),
          ),
        );
      default:
        return Container();
    }
  }
}


 