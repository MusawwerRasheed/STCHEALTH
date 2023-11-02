import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stc_health/Data/Repository/login_repo.dart';
import 'package:stc_health/Data/Repository/product_repo.dart';
import 'package:stc_health/Presentation/Authentication/Login/Controllers/login_cubit.dart';
import 'package:stc_health/Presentation/Products/products_cubit.dart';
import 'package:http/http.dart' as http;
 
   final loginRepository = LoginRepository();

List<BlocProvider> allproviders = [ BlocProvider<ProductCubit>(
            create: (BuildContext context) => ProductCubit(
              repository: ProductRepository(httpClient: http.Client()),
            ),
          ),
          BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit(loginRepository),
          ),];