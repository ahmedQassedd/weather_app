import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/network/local/cache_helper.dart';
import 'package:weather/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:weather/core/util/blocs/app_cubit/app_states.dart';
import 'package:weather/core/util/widgets/navigate_and_finish.dart';
import 'package:weather/core/util/widgets/show_toast.dart';
import 'package:weather/features/home_page/presentation/page/home_page.dart';
import 'package:weather/features/intro_page/presentation/widgets/intro_widgets.dart';


class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SuccessDailyWeather) {


          CacheHelper.saveData(
                  key: 'myCity', value: countryController.text)
              .then((value) {
                AppCubit.get(context).getDaysWeather(country: countryController.text) ;
                AppCubit.get(context).getFavoriteWeatherModel(country: countryController.text) ;

                navigateAndFinish(context: context, widget: HomePage());
          });


        }

        else if(state is ErrorDailyWeather)
          {

            showToast(text: 'No Cities Found!');
          }


      },
      builder: (context, state) {
        return mainIntroWidget(context , state);
      },
    );
  }
}
