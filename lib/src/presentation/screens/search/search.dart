import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/presentation/screens/widgets/coomon_widget.dart';
import 'package:news_app/src/presentation/logic/cubit/app_cubit.dart';
import 'package:news_app/src/presentation/logic/cubit/app_cubit_states.dart';

class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField2(
                  controller: searchController,
                  label: 'search',
                  prefix: Icons.search,
                  type: TextInputType.text,
                  oncahnge: (value) {
                    AppCubit.get(context).GetSearch(value: value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(child: bulidScreenNews(list, context, Search: true)),
            ],
          ),
        );
      },
    );
  }
}
