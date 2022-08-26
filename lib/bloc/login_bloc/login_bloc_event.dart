abstract class LoginBlocEvent {
  const LoginBlocEvent();
}

class UpdateLoadingState extends LoginBlocEvent {
  final bool isLoading;

  UpdateLoadingState(this.isLoading);
}

class LoginToServer extends LoginBlocEvent {
  LoginToServer();
}
