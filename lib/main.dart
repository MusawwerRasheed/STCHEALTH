import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health/Application/Products/products_cubit.dart';
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Data/Repository/product_repo.dart';
import 'package:stc_health/Presentation/Widgets/Auth/BottomNavigation/all_products.dart';
import 'package:stc_health/Presentation/Widgets/Auth/login_screen.dart';
import 'package:http/http.dart' as http;


//  void main() {
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider<YourBloc>(
//           create: (BuildContext context) => YourBloc(),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
 
 


void main() {
  runApp(

    MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (BuildContext context) => ProductCubit(repository: ProductRepository(httpClient: http.Client())),
        ),],
      child: MyApp(),
    ),

    //  MyAp?p(),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Bit borge',
            theme: ThemeData(
              primaryColor: Appcolors.primarycolor
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: '/p',
             routes: {
        '/': (context) => LoginScreen(),
        '/p': (context)=> AllProductsPage(),
      },
          );
        });
  }
}

