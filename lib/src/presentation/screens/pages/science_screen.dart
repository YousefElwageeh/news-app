import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/presentation/screens/widgets/coomon_widget.dart';
import 'package:news_app/src/presentation/logic/cubit/app_cubit.dart';
import 'package:news_app/src/presentation/logic/cubit/app_cubit_states.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var items = AppCubit.get(context).Science;
        return bulidScreenNews(items, context);
      },
    );
  }
}
