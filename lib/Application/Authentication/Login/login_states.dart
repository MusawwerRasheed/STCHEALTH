class LoginState {
  final String? email;
  final String? password;
  final bool? isSubmitting;
  final bool? isSuccess;
  final String? errorMessage;

  LoginState({
     this.email,
     this.password,
     this.isSubmitting,
     this.isSuccess,
     this.errorMessage,
  }
  );

  factory LoginState.initial() {
    return LoginState(
      email: '',
      password: '',
      isSubmitting: false,
      isSuccess: false,
      errorMessage: '',
    );
  }

   
  LoginState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) 
  

  {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
