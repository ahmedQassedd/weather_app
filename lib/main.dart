import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/network/local/cache_helper.dart';
import 'package:weather/core/network/remote/dio_helper.dart';
import 'package:weather/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:weather/core/util/blocs/app_cubit/app_states.dart';
import 'package:weather/core/util/blocs/app_cubit/bloc_observer/bloc_observer.dart';
import 'package:weather/core/util/const.dart';
import 'package:weather/core/util/widgets/light_theme.dart';
import 'package:weather/features/home_page/presentation/page/home_page.dart';
import 'package:weather/features/intro_page/presentation/page/intro_page.dart';
import 'package:flutter/services.dart' ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp , DeviceOrientation
    .portraitDown]
  );

  myCity = CacheHelper.getData(key: 'myCity');
  favoriteCity = CacheHelper.getData(key: 'favoriteCity');

  Widget page;

  if (myCity != null) {
    page = HomePage();
  } else {
    page = IntroPage();
  }

  runApp(MyApp(firstPage: page));
}

class MyApp extends StatelessWidget {
  Widget firstPage;

  MyApp({Key? key, required this.firstPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => AppCubit()..getDailyWeather(country: myCity)..getDaysWeather(country: myCity)..getFavoriteWeatherModel(country: favoriteCity ?? myCity),
      child: BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightingTheme(),
          home: firstPage,
        );
      }),
    );
  }
}
