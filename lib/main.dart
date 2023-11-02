import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stc_health/Application/Services/providers.dart';
import 'package:stc_health/Presentation/Authentication/Login/Controllers/login_cubit.dart';
import 'package:stc_health/Presentation/Products/products_cubit.dart';
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Data/Repository/login_repo.dart';
import 'package:stc_health/Data/Repository/product_repo.dart';
import 'package:stc_health/Presentation/Widgets/Auth/BottomNavigation/all_products.dart';
import 'package:stc_health/Presentation/Widgets/Auth/login_screen.dart';
import 'package:device_preview/device_preview.dart';

 
 
void main() async {
  final loginRepository = LoginRepository();

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  print('token val is $token');

  String initialRoute = '/login';
  if (token != null && token.isNotEmpty) {
    initialRoute = '/products';
  }

  runApp(
    DevicePreview( // Wrap your app with DevicePreview
      enabled: true,
      builder: (context) => MultiBlocProvider(
        providers: allproviders,
        child: MyApp(initialRoute: initialRoute),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          builder: DevicePreview.appBuilder, // Enable device preview
          title: 'Bit borge',
          theme: ThemeData(
            primaryColor: Appcolors.primarycolor,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          routes: {
            '/login': (context) => LoginScreen(),
            '/products': (context) => AllProductsPage(),
          },
        );
      },
    );
  }
}









//  void main() {
//   final loginRepository = LoginRepository();
  // runApp(
  //   MultiBlocProvider(
  //     providers: [
  //       BlocProvider<ProductCubit>(
  //         create: (BuildContext context) => ProductCubit(
  //           repository: ProductRepository(httpClient: http.Client()),
  //         ),
  //       ),
  //       BlocProvider<LoginCubit>(
  //         create: (BuildContext context) => LoginCubit(loginRepository), 
  //       ),
  //     ],
  //     child: MyApp(),
  //   ),
  // )

// }
