import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:weather/core/util/blocs/app_cubit/app_states.dart';
import 'package:weather/core/util/widgets/show_toast.dart';
import 'package:weather/features/search_page/presentation/widgets/search_widgets.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is ErrorSearchDailyWeather){

          showToast(text: 'No Cities Found!');

        }
      },
      builder: (context, state) {
        return mainSearchWidget(context , state);
      },
    );
  }
}
