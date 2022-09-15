import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:meta/meta.dart';
 

import '../../model/news_model.dart';
import '../../model/sections_model.dart';
import '../Lectures/lectures_cubit.dart';
import '../network/dio_helper.dart';
import '../network/end_points.dart';
  
part 'news_state.dart';

 

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  //single instance
  static NewsCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  News? data = News();

  Future getData() async {
    emit(GetData());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDEsInJvbGUiOjQsImlhdCI6MTY2Mjk4MjE5NCwiZXhwIjoxNzQ5MzgyMTk0fQ.gD0pxtdsO1gPRnrpv4Mh2EJPqf-BxxL7fosY-B_BNag";
    DioHelper.getData(url: newsEndPoint, token: token).then(
      (value) {
        if (value.statusCode == 200) {
          data = News.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(GetData());

        }
      },
    );
    emit(GetData());
  }
}
