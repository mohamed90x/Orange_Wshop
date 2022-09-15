
import 'package:flutter_bloc/flutter_bloc.dart';
 
 

 
import '../../model/signin_model.dart';
import '../network/dio_helper.dart';
import '../network/end_points.dart';
 
 
part 'signin_state.dart';

class SignCubit extends Cubit<SignInState> {
  SignCubit() : super(SignInInitial());

  //single instance
  static SignCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  LoginModel? data = LoginModel();
  
  Future getData(String email , String pass) async {
    emit(LoginLoading());
    
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDEsInJvbGUiOjQsImlhdCI6MTY2Mjk4MjE5NCwiZXhwIjoxNzQ5MzgyMTk0fQ.gD0pxtdsO1gPRnrpv4Mh2EJPqf-BxxL7fosY-B_BNag";
    DioHelper.postData(url: loginEndPoint, token: token, 
    data: {
      'email':email,
      'password':pass
    },).then(
      (value) {
        if (value.statusCode == 200) {
          data = LoginModel.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(LoginSuccess(data!));

        }
      },
    ).catchError((onError){
       emit(LoginFail(onError.toString()));

    });
    
  }
}
