import 'dart:math';

 
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/dio_helper.dart';
import '../network/end_points.dart';
import 'midterms_model.dart';
 

part 'midterms_state.dart';

class MidtermCubit extends Cubit<MidtermState> {
  MidtermCubit() : super(MidTermInitial());

  //single instance
  static MidtermCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  MidTermsModel? data = MidTermsModel();

  Future getData() async {
    emit(GetData());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDEsInJvbGUiOjQsImlhdCI6MTY2Mjk4MjE5NCwiZXhwIjoxNzQ5MzgyMTk0fQ.gD0pxtdsO1gPRnrpv4Mh2EJPqf-BxxL7fosY-B_BNag";
    DioHelper.getData(url:userExamsEndPoint , token: token).then(
      (value) {
        if (value.statusCode == 200) {
          data = MidTermsModel.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(GetData());

        }
      },
    );
    emit(GetData());
  }
}
