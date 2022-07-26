// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/screens/home_layout.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/app_cubit_states.dart';
import 'package:news_app/shared/cubit/bloc_observer.dart';
import 'package:news_app/shared/dio_helper.dart';
import 'package:news_app/shared/shared_preferences.dart';
import 'package:news_app/styles/Themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await SharedHelper.init();
  bool? isdark = SharedHelper.getbool();
  runApp(MyApp(isdark));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool? isdark;

  const MyApp(this.isdark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..GetBusinessData()
        ..GetScienceData()
        ..GetSportsData()
        ..ChangeModeApp(fromshared: isdark),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: AppCubit.get(context).darkmode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Homelayout(),
          );
        },
      ),
    );
  }
}
