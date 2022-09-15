part of 'signin_cubit.dart';

 
abstract class SignInState {}

class SignInInitial extends SignInState {}
class GetData extends SignInState {}

class LoginSuccess extends SignInState {
  LoginModel data;
  LoginSuccess(this.data);
}

class LoginLoading extends SignInState {}

class LoginFail extends SignInState {
  String error;
  LoginFail(this.error);

}



