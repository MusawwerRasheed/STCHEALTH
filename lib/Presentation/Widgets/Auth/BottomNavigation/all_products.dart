import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stc_health/Application/Products/products_cubit.dart';
import 'package:stc_health/Application/Products/products_states.dart';
import 'package:stc_health/Application/Services/NavigationServices/navigation.dart';
import 'package:stc_health/Data/DataSource/Static/assets.dart';
import 'package:stc_health/Data/DataSource/Static/text_styles.dart';
import 'package:stc_health/Domain/Models/product_model.dart';
import 'package:stc_health/Presentation/Common/app_text.dart';
import 'package:stc_health/Presentation/Widgets/Auth/BottomNavigation/single_product.dart';
import 'package:stc_health/Presentation/Widgets/Auth/BottomNavigation/single_product_details.dart';  
  


class AllProductsPage extends StatefulWidget {


// final Product? product;

  const AllProductsPage({super.key, 
  //  this.product
   }); 

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
 

  @override
  void initState() {
  
    BlocProvider.of<ProductCubit>(context).fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Extend the body behind the AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text('All Products')),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadedState) {
            final products = state.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(onTap: (){
                        Navigate.to(context,SingleProductDetails(description: product.description, imageurl: product.image,
                        price: product.price, rate: product.rating, ));
                      },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), 
                          color: Colors.grey,  
                           ),
                          child: Stack(  
                            children: [Image.network(product.image, fit: BoxFit.fill,
                          width: 400.w, height: 200.h,), 
                          Positioned(top: 150.h, left: 20.w, child:
                          
                          Row(
                            children: [
                              Text(
                                     product.price.toString(), 
                                    style: Styles.openSansBold(context, fontSize: 14.sp, 
                                    color:Colors.white),
                                  ), SizedBox(width: 120.w,), 
                                   Row(
  children: List.generate(
    product.rating.rate.ceil(), // Use ceil to round up to the nearest integer
    (index) => Icon(
      index < product.rating.rate
          ? Icons.star
          : Icons.star_half, // Display a half-star if the index is less than the rate
      color: Colors.yellow,
    ),
  ),
)

                            ],
                          ),
                                            
                          
                          ), 
                                          
                          ],),
                        
                                          
                                          
                        ),
                      ), 
                  
                      SizedBox(height: 15.h,), 
                   
                   Padding(
                     padding:  EdgeInsets.only(left:15.sp),
                     child: Text(
                                     product.title.toString(), 
                                    style: Styles.openSansRegular(context, fontSize: 12.sp, fontstyle: FontStyle.italic,
                                    color:Color.fromARGB(255, 99, 90, 90)),
                                  ),
                   ),

                   Padding(
                     padding:  EdgeInsets.only(left:15.sp),
                     child: Text(product.description, style: Styles.openSansRegular(context, fontSize: 11.sp, ),),
                   ), 

                   SizedBox(height: 40.h,), 
                   Container(color: Color.fromARGB(255, 231, 223, 223), height: 1.5.h, width: 315.w,), 
                  
                

                    ],
                  ),
                );




 
              },
            );
          } else if (state is ProductErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
















// class AllProductsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body: 
//            Container(
//            child: Padding(
//           padding: EdgeInsets.all(7.sp),
//           child: Column(
//             children: [             
//                GestureDetector( 
//                 onTap: () {
//                   Navigate.to(context, SingleProductDetails()); 
//                 },
//                 child: SmallImage()),
//                SizedBox(height: 10.h,),
//                Align(alignment: Alignment.topLeft,
//                  child: AppText('product name',
//                  style:
//                   TextStyle(fontStyle: FontStyle.italic,
//                    fontSize: 20.sp,),
//                  ),
//                ),      
//                 SizedBox(height: 10.h,), 
//                 Text(Utils.LoremShort),
//                 SizedBox(height: 15.h,),
//                 Container(width:300.w, height: 1.h, color: 
//                 Colors.grey,),
//                 SizedBox(height: 10.h),              
//             ],
//           ),
//              ),
//        )
// ,
//     ); 
//   }
// }