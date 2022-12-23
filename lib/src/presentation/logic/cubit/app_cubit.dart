// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/utils/app_string.dart';
import 'package:news_app/src/presentation/screens/pages/settings_screen.dart';

import 'package:news_app/src/presentation/logic/cubit/app_cubit_states.dart';
import 'package:news_app/src/core/shared_preferences.dart';

import '../../screens/pages/business_screen.dart';
import '../../screens/pages/science_screen.dart';
import '../../screens/pages/sports_screen.dart';
import '../../../core/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInit());

  static AppCubit get(context) => BlocProvider.of(context);
  int indexOfScreen = 0;
  List screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    SettingsScreen(),
  ];

  List<BottomNavigationBarItem> BN = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: AppStrings.business),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: AppStrings.science),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: AppStrings.sport),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: AppStrings.settings),
  ];
  void bottom_navigator(int index) {
    indexOfScreen = index;
    emit(BottomNavigator());
  }

  List business = [];
  void GetBusinessData() {
    emit(LodaingGetNews());
    DioHelper.getdata(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '2cf282ad0bc540c0b4dc67522e38ff99',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(GetNewsSuccess());
    }).catchError((e) {
      print(e);
      emit(GetNewsErorr(e));
    });
  }

  List Sports = [];
  void GetSportsData() {
    emit(LodaingGetSportsNews());
    DioHelper.getdata(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '2cf282ad0bc540c0b4dc67522e38ff99',
    }).then((value) {
      Sports = value.data['articles'];
      print(Sports[0]['title']);
      emit(GetSportsNewsSuccess());
    }).catchError((e) {
      print(e);
      emit(GetSportsNewsErorr(e));
    });
  }

  List Science = [];
  void GetScienceData() {
    emit(LodaingGetScienceNews());
    DioHelper.getdata(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '2cf282ad0bc540c0b4dc67522e38ff99',
    }).then((value) {
      Science = value.data['articles'];
      print(Science[0]['title']);
      emit(GetScienceNewsSuccess());
    }).catchError((e) {
      print(e);
      emit(GetScienceNewsErorr(e));
    });
  }

  List<dynamic> Search = [];
  void GetSearch({required String value}) {
    emit(LodaingGetSearchNews());
    DioHelper.getdata(url: 'v2/everything', quary: {
      'q': value,
      'apiKey': '2cf282ad0bc540c0b4dc67522e38ff99',
    }).then((value) {
      Search = value.data['articles'];
      print(Search[0]['title']);
      emit(GetSearchNewsSuccess());
    }).catchError((e) {
      print(e);
      emit(GetSearchNewsErorr(e));
    });
  }

  bool darkmode = false;

  ThemeMode? mode;
  ChangeModeApp({
    bool? fromshared,
  }) {
    if (fromshared != null) {
      darkmode = fromshared;
      emit(ChangeModeTheme());
    } else {
      darkmode = !darkmode;
      SharedHelper.putbool(dark: darkmode);
      emit(ChangeModeTheme());
    }
  }
}
