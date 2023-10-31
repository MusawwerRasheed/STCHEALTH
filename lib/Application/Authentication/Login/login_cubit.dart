import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stc_health/Application/Authentication/Login/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  // Methods to update the state based on user actions.
  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void startLogin() {
    emit(state.copyWith(isSubmitting: true, errorMessage: ''));

    // Perform the login logic here (e.g., make an API call).
    // Update the state based on the result.
    // If successful, set isSuccess to true; if not, set errorMessage.

    
  }
}
