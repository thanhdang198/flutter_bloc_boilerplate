import 'package:equatable/equatable.dart';

class LoginBlocState extends Equatable {
  final bool isLoading;

  final bool hasError;
  final String errorMessage;

  factory LoginBlocState.initial() => const LoginBlocState(
        isLoading: false,
        hasError: false,
        errorMessage: '',
      );
  const LoginBlocState(
      {required this.hasError,
      required this.errorMessage,
      required this.isLoading});

  LoginBlocState copyWith(
      {bool? isLoading, bool? hasError, String? errorMessage}) {
    return LoginBlocState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, hasError];
}
