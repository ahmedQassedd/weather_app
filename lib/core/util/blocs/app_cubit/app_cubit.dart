import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/models/daily_weather_model.dart';
import 'package:weather/core/models/days_weather_model.dart';
import 'package:weather/core/network/remote/dio_helper.dart';
import 'package:weather/core/network/remote/end_points.dart';
import 'package:weather/core/util/blocs/app_cubit/app_states.dart';
import 'package:weather/features/search_page/presentation/widgets/search_widgets.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  DailyWeatherModel? dailyWeatherModel;

  void getDailyWeather({required country}) {
    emit(LoadingDailyWeather());

    DioHelper.getData(
      endPoint: dailyEndPoint,
      country: country ?? '',
    ).then((value) {
      dailyWeatherModel = DailyWeatherModel.fromJson(value.data);



      emit(SuccessDailyWeather());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ErrorDailyWeather());
    });
  }



  DailyWeatherModel? searchDailyWeatherModel;

  void getSearchDailyWeather({required country}) {
    searchDailyWeatherModel = null ;

    emit(LoadingSearchDailyWeather());

    DioHelper.getData(
      endPoint: dailyEndPoint,
      country: country ?? '',
    ).then((value) {
      searchDailyWeatherModel = DailyWeatherModel.fromJson(value.data);

      debugPrint('$searchDailyWeatherModel');

      emit(SuccessSearchDailyWeather());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ErrorSearchDailyWeather());
    });
  }





  DailyWeatherModel? favoriteWeatherModel;

  void getFavoriteWeatherModel({required country}) {
    favoriteWeatherModel = null ;

    emit(LoadingFavoriteWeather());

    DioHelper.getData(
      endPoint: dailyEndPoint,
      country: country ?? '',
    ).then((value) {
      favoriteWeatherModel = DailyWeatherModel.fromJson(value.data);

      debugPrint('$favoriteWeatherModel');

      emit(SuccessFavoriteWeather());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ErrorFavoriteWeather());
    });
  }





  DaysWeatherModel? daysWeatherModel ;

  void getDaysWeather({required country}) {

    emit(LoadingDaysWeather());

    DioHelper.getData(
      endPoint: daysEndPoint,
      country: country ?? '',
    ).then((value) {
      daysWeatherModel = DaysWeatherModel.fromJson(value.data) ;

      emit(SuccessDaysWeather());
    }).catchError((onError) {
      debugPrint(onError.toString());

      emit(ErrorDaysWeather());
    });
  }




  DaysWeatherModel? searchDaysWeatherModel ;

  void getSearchDaysWeather({required country}) {

    searchDaysWeatherModel = null ;

    emit(LoadingSearchDaysWeather());

    DioHelper.getData(
      endPoint: daysEndPoint,
      country: country ?? '',
    ).then((value) {
      searchDaysWeatherModel = DaysWeatherModel.fromJson(value.data) ;

      emit(SuccessSearchDaysWeather());
    }).catchError((onError) {
      debugPrint(onError.toString());

      emit(ErrorSearchDaysWeather());
    });
  }




  void clearSearchPage(context){

    AppCubit.get(context).searchDailyWeatherModel = null ;
    AppCubit.get(context).searchDaysWeatherModel = null ;
    searchController.text = '' ;

    emit(ClearSearchPage());

  }


}









