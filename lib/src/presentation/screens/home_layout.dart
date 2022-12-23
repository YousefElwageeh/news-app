import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/src/presentation/screens/widgets/coomon_widget.dart';
import 'package:news_app/src/presentation/logic/cubit/app_cubit.dart';
import 'package:news_app/src/presentation/logic/cubit/app_cubit_states.dart';

import 'search/search.dart';

class Homelayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News app',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(
                      context,
                      searchScreen(),
                    );
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.ChangeModeApp();
                  },
                  icon: const Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: cubit.screens[cubit.indexOfScreen],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.indexOfScreen,
            onTap: (index) {
              cubit.bottom_navigator(index);
            },
            items: cubit.BN,
          ),
        );
      },
    );
  }
}
