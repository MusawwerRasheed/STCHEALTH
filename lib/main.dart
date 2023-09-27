import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Presentation/Widgets/Auth/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
            initialRoute: '/',
             routes: {
        '/': (context) => LoginScreen(),
      },
          );
        });
  }
}

