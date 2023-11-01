import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stc_health/Application/Authentication/Login/login_states.dart';
import 'package:stc_health/Data/Repository/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository;

  LoginCubit(this._repository) : super(LoginInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    try {
      final token = await _repository.login(username, password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token); // Store the token in SharedPreferences
      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

