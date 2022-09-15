import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:meta/meta.dart';

import '../../model/lecture_model.dart';
import '../network/dio_helper.dart';
import '../network/end_points.dart';
 
 

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  //single instance
  static LecturesCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  LectureModel? data = LectureModel();

  Future getData() async {
    emit(GetData());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDEsInJvbGUiOjQsImlhdCI6MTY2Mjk4MjE5NCwiZXhwIjoxNzQ5MzgyMTk0fQ.gD0pxtdsO1gPRnrpv4Mh2EJPqf-BxxL7fosY-B_BNag";
    DioHelper.getData(url: lectureEndPoint, token: token).then(
      (value) {
        if (value.statusCode == 200) {
          data = LectureModel.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(GetData());

        }
      },
    );
    emit(GetData());
  }
}
