import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data_layer/cashe_helper.dart';
import '../../data_layer/remotly_data.dart';
import '../../ui_layer/news_app_modules/business.dart';
import '../../ui_layer/news_app_modules/scince.dart';
import '../../ui_layer/news_app_modules/sports.dart';
import 'news_states.dart';


class NewsAppCubit extends Cubit<NewsAppStates>{
  NewsAppCubit():super(InitialState());
  static NewsAppCubit get(context) =>BlocProvider.of(context);


  var currentIndex=0;
 List<BottomNavigationBarItem> items= const [
   BottomNavigationBarItem(
       icon: Icon(Icons.business), label: 'Business'),
   BottomNavigationBarItem(
       icon: Icon(Icons.sports), label: 'sports'),
   BottomNavigationBarItem(
       icon: Icon(Icons.science), label: 'science'),

 ];
 List<Widget> screens=const[
   Business(),
   Sports(),
   Science(),

 ];


 void navBar(int index){
   currentIndex=index;
   emit(NavBarState());
 }
  List<dynamic>business=[];
 void GetBusinessData(){
   emit(GetBusinessDataLoading());
   DioHelper.getAllData(url: 'v2/top-headlines', query: {
     'country':'us',
     'category':'business',
     'apiKey':'1aa683c7654a4531ac79f29e91ce1e7a',
   }).then((value) {
     business =value.data['articles'];


     emit(GetBusinessDataSuccess());

   }).catchError((error){
     print(error.toString());
     emit(GetBusinessDataError((error.toString())));
   });
 }


  List<dynamic>sports=[];
  void GetSportsData(){
    emit(GetScienceDataLoading());
    DioHelper.getAllData(url: 'v2/top-headlines', query: {
      'country':'us',
      'category':'sport',
      'apiKey':'1aa683c7654a4531ac79f29e91ce1e7a',

    }).then((value) {
      sports =value.data['articles'];


      emit(GetScienceDataSuccess());

    }).catchError((error){
      print(error.toString());
      emit(GetScienceDataError((error.toString())));
    });
  }


  List<dynamic>science=[];
  void GetScienceData(){
    emit(GetScienceDataLoading());
    DioHelper.getAllData(url: 'v2/top-headlines', query: {
      'country':'us',
      'category':'science',
      'apiKey':'1aa683c7654a4531ac79f29e91ce1e7a',

    }).then((value) {
      science =value.data['articles'];


      emit(GetScienceDataSuccess());

    }).catchError((error){
      print(error.toString());
      emit(GetScienceDataError((error.toString())));
    });
  }


  List<dynamic>search=[];
  void GetSearchData(String value){
    emit(GetSearchDataLoading());
    DioHelper.getAllData(url: 'v2/everything', query: {
     'q':'${value}',
      'apiKey':'1aa683c7654a4531ac79f29e91ce1e7a',

    }).then((value) {
      search =value.data['articles'];


      emit(GetSearchDataSuccess());

    }).catchError((error){
      print(error.toString());
      emit(GetSearchDataError((error.toString())));
    });
  }

 var isDark=false;

  void isDarkTogel({ bool? returnedBool}) {
    if (returnedBool != null) {
      isDark = returnedBool;
      emit(ThemModeState());
    } else {
      isDark = !isDark;
      emit(ThemModeState());
      CasheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ThemModeState());
      });
    }

    void checkButton() {
      print('I am okey');
    }
  }
}