import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stc_health/Application/Authentication/Login/login_cubit.dart';
import 'package:stc_health/Application/Authentication/Login/login_states.dart'; 
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Data/DataSource/Static/strings.dart';
import 'package:stc_health/Data/DataSource/Static/text_styles.dart';
import 'package:stc_health/Data/Repository/login_repo.dart';
import 'package:stc_health/Presentation/Common/app_text.dart';
import 'package:stc_health/Presentation/Common/button.dart';
import 'package:stc_health/Presentation/Common/form_textfield.dart';
import 'package:stc_health/Presentation/Widgets/Auth/BottomNavigation/all_products.dart';
  


// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final LoginRepository loginRepository = LoginRepository();

//   void login(BuildContext context) async {
//     final username = usernameController.text;
//     final password = passwordController.text;

//     try {
//       final token = await loginRepository.login(username, password);
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', token);
//       print(token);        
//        Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const AllProductsPage(),
//         ),
//       );
//     } catch (e) {
   
//       print('Login failed: $e');
//     }
//   }

//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 300.h,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Appcolors.darkblue, Appcolors.lightblue],
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.topRight,
//                       ),
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           bottom: 180.h,
//                           left: 100.w,
//                           child: AppText(
//                             Strings.STCHealth,
//                             style: Styles.openSansRegular(context,
//                                 fontSize: 28.sp, color: Appcolors.primarycolor),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 20.h,
//                           left: 14.w,
//                           child: AppText(
//                             Strings.Login,
//                             style: Styles.openSansBold(context,
//                                 color: Appcolors.primarycolor, fontSize: 18.sp),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(16.sp),
//                     child: Column(
//                       children: [
//                         CustomTextField(
//                           label: 'User Name',
//                           inputcontroller: usernameController,
//                           hintText: 'Enter User Name',
//                           suffix: SvgPicture.asset('assets/images/Checkmark.svg'),
//                         ),
//                         CustomTextField(
//                           label: 'Password',
//                           inputcontroller: passwordController,
//                           hintText: 'Enter Password',
//                           obscure: false,
//                           suffix: SvgPicture.asset('assets/images/Eye.svg'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   CustomButton(
//                     buttonheight: 50.h,
//                     text: 'Continue',
//                     onPressed: () {
//                       login(context);
//                     },
//                   ),
//                   SizedBox(height: 10.h),
//                   AppText(
//                     'NEED HELP?',
//                     style: Styles.openSansBold(context),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

 
 
 

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginRepository loginRepository = new LoginRepository();

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(loginRepository), // Create the LoginCubit
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
           
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllProductsPage(),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginFailure) {
              return Column(
                children: [
                  Text('Login failed: ${state.error}'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginCubit>().login(
                        usernameController.text,
                        passwordController.text,
                      );
                    },
                    child: Text('Retry'),
                  ),
                ],
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Appcolors.darkblue, Appcolors.lightblue],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 180,
                            left: 100,
                            child: AppText(
                              Strings.STCHealth,
                              style: Styles.openSansRegular(context,
                                  fontSize: 28, color: Appcolors.primarycolor),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 14,
                            child: AppText(
                              Strings.Login,
                              style: Styles.openSansBold(context,
                                  color: Appcolors.primarycolor, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'User Name',
                            inputcontroller: usernameController,
                            hintText: 'Enter User Name',
                            suffix: SvgPicture.asset('assets/images/Checkmark.svg'),
                          ),
                          CustomTextField(
                            label: 'Password',
                            inputcontroller: passwordController,
                            hintText: 'Enter Password',
                            obscure: false,
                            suffix: SvgPicture.asset('assets/images/Eye.svg'),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      buttonheight: 50,
                      text: 'Continue',
                      onPressed: () {
                        context.read<LoginCubit>().login(
                          usernameController.text,
                          passwordController.text,
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    AppText(
                      'NEED HELP?',
                      style: Styles.openSansBold(context),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
