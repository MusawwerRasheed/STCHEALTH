import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stc_health/Presentation/Authentication/Login/Controllers/login_cubit.dart';
import 'package:stc_health/Presentation/Authentication/Login/Controllers/login_states.dart'; 
import 'package:stc_health/Data/DataSource/Static/color_pallets.dart';
import 'package:stc_health/Data/DataSource/Static/strings.dart';
import 'package:stc_health/Data/DataSource/Static/text_styles.dart';
import 'package:stc_health/Data/Repository/login_repo.dart';
import 'package:stc_health/Presentation/Common/app_text.dart';
import 'package:stc_health/Presentation/Common/button.dart';
import 'package:stc_health/Presentation/Common/form_textfield.dart';
import 'package:stc_health/Presentation/Widgets/Auth/BottomNavigation/all_products.dart';
  
   

class LoginScreen extends StatefulWidget {
  
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LoginRepository loginRepository = LoginRepository();
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final FocusNode usernameFocusNode = FocusNode();
final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(loginRepository),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllProductsPage(),
                ),
              );
            } else if (state is LoginFailure) {
              Fluttertoast.showToast(
                msg: 'Login failed: ${state.error}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(),
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
                              style: Styles.openSansRegular(
                                context,
                                fontSize: 28,
                                color: Appcolors.primarycolor,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 14,
                            child: AppText(
                              Strings.Login,
                              style: Styles.openSansBold(
                                context,
                                color: Appcolors.primarycolor,
                                fontSize: 18,
                              ),
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
                            inputfocusnode: usernameFocusNode,
                            inputcontroller: usernameController,
                            // hintText: 'Enter User Name',
                            // suffix: SvgPicture.asset('assets/images/Checkmark.svg'),
                          ),
                          CustomTextField(
                            label: 'Password',
                            inputfocusnode: passwordFocusNode,
                            inputcontroller: passwordController,
                            // hintText: 'Enter Password',
                            obscure: false,
                            // suffix: SvgPicture.asset('assets/images/Eye.svg'),
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
