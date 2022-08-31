import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/models/days_weather_model.dart';
import 'package:weather/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:weather/core/util/widgets/background.dart';
import 'package:weather/core/util/widgets/navigete_to.dart';
import 'package:weather/features/search_page/presentation/page/search_page.dart';

GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

Widget mainHomeWidget(context) => ConditionalBuilder(
    condition: (AppCubit.get(context).dailyWeatherModel != null && AppCubit.get(context).favoriteWeatherModel != null &&
        AppCubit.get(context).daysWeatherModel != null),
    builder: (context) => SafeArea(
      child: Scaffold(
          key: _globalKey,
          drawer: Drawer(

            backgroundColor: const Color(0xff07080C).withOpacity(0.8),
            child: ListView(
              padding: const EdgeInsets.only(left: 20, right: 15),
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: [
                        Column(children: [
                          Row(
                            children: [
                              Text(
                                'Your Location',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey[500],
                                size: 17,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${AppCubit.get(context).dailyWeatherModel?.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${(AppCubit.get(context).dailyWeatherModel!.main!.tempMin! - 273.15).round().toString()}\u00B0 / ${(AppCubit.get(context).dailyWeatherModel!.main!.tempMax! - 273.15).round().toString()}\u00B0',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ],),

                        const SizedBox(height:80),

                        Column(children: [
                          Row(
                            children: [
                              Text(
                                'Favorite Location',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey[500],
                                size: 17,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${AppCubit.get(context).favoriteWeatherModel?.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${(AppCubit.get(context).favoriteWeatherModel!.main!.tempMin! - 273.15).round().toString()}\u00B0 / ${(AppCubit.get(context).favoriteWeatherModel!.main!.tempMax! - 273.15).round().toString()}\u00B0',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ],),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Stack(
            alignment: Alignment.topLeft,
            children: [
              background(),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: ConditionalBuilder(
                      condition:
                      (AppCubit.get(context).dailyWeatherModel != null && AppCubit.get(context).favoriteWeatherModel != null &&
                          AppCubit.get(context).daysWeatherModel != null),
                      builder: (context) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          topBar(context),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  firstContainer(context),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  secondContainer(context),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  thirdContainer(context),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()))),
            ],
          )),
    ),
    fallback: (context) =>
    const Center(child: CircularProgressIndicator()));

Widget hoursItem({required Listt model}) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat("jm").format(DateTime.parse('${model.dtTxt}')),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(
          height: 10,
        ),
        {
          '12',
          '15',
          '06',
          '09'
        }.contains(DateFormat("H").format(DateTime.parse('${model.dtTxt}')))
            ? const SizedBox(
                height: 30,
                width: 30,
                child: Image(image: AssetImage('assets/sun_icon.png')))
            : const SizedBox(
                height: 30,
                width: 30,
                child: Image(image: AssetImage('assets/moon_icon.png'))),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${(model.main?.temp - 273.15).round().toString()}\u00B0',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );

Widget topBar(context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              _globalKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu_open_rounded,
              color: Colors.white,
            )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${AppCubit.get(context).dailyWeatherModel?.name}',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            AppCubit.get(context).clearSearchPage(context);
            navigateTo(context: context, widget: SearchPage());
          },
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ],
    );

Widget firstContainer(context) => Container(
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${(AppCubit.get(context).dailyWeatherModel!.main!.temp! - 273.15).round().toString()}\u00B0',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 80),
            ),
            Text(
              '${(AppCubit.get(context).dailyWeatherModel!.main!.tempMin! - 273.15).round().toString()}\u00B0 / ${(AppCubit.get(context).dailyWeatherModel!.main!.tempMax! - 273.15).round().toString()}\u00B0',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: {6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}
                          .contains(DateTime.now().hour)
                      ? LottieBuilder.asset('assets/sun.json')
                      : LottieBuilder.asset('assets/moon.json')),
              SizedBox(
                width: 100,
                child: Text(
                    '${AppCubit.get(context).dailyWeatherModel?.weather![0].description}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
        )
      ],
    ));

Widget secondContainer(context) => Container(
      padding: const EdgeInsets.all(15),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => hoursItem(
                model: AppCubit.get(context).daysWeatherModel!.list[index]),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 15.0,
                ),
            itemCount: AppCubit.get(context).daysWeatherModel!.list.length),
      ),
    );

Widget thirdContainer(context) => Container(
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => daysItem(
                  model: AppCubit.get(context).daysWeatherModel!.list[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 3,
                  ),
              itemCount: AppCubit.get(context).daysWeatherModel!.list.length),
        ),
      ],
    ));

Widget daysItem({required Listt model}) =>
    {'15'}.contains(DateFormat("H").format(DateTime.parse('${model.dtTxt}')))
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 130,
                child: Text(
                  DateFormat("MMMEd").format(DateTime.parse('${model.dtTxt}')),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(image: AssetImage('assets/sun_icon.png'))),
              Text(
                '${(model.main?.tempMin - 273.15).round().toString()}\u00B0 / ${(model.main?.tempMax - 273.15).round().toString()}\u00B0',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          )
        : const SizedBox();
