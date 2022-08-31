import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/network/local/cache_helper.dart';
import 'package:weather/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:weather/core/util/blocs/app_cubit/app_states.dart';
import 'package:weather/core/util/const.dart';
import 'package:weather/core/util/widgets/show_toast.dart';
import 'package:weather/core/util/widgets/text_form_field.dart';
import 'package:weather/features/home_page/presentation/widgets/home_widgets.dart';

var searchController = TextEditingController();
var formKey = GlobalKey<FormState>();

Widget mainSearchWidget(context, state) => SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white10 ,
          body: Stack(

        children: [

          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  theTextFormField(context),
                  ConditionalBuilder(
                      condition: AppCubit.get(context)
                                  .searchDailyWeatherModel !=
                              null &&
                          AppCubit.get(context).searchDaysWeatherModel != null,
                      builder: (context) => Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  topBar(context),
                                  const SizedBox(
                                    height: 8,
                                  ),
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
                      fallback: (context) =>
                          (state is LoadingSearchDailyWeather ||
                                  state is LoadingSearchDaysWeather)
                              ? const LinearProgressIndicator(
                                  color: Colors.blue,
                                  backgroundColor: Colors.grey,
                                  minHeight: 0.9,
                                )
                              : const SizedBox()),
                ],
              ),
            ),
          ),
        ],
      )),
    );

Widget theTextFormField(context) => defaultTextFormField(
      controller: searchController,
      inputType: TextInputType.text,
      hint: 'Search...',
      suffixIcon: Icons.search,
      suffixPressed: () {
        if (formKey.currentState!.validate()) {
          AppCubit.get(context)
              .getSearchDailyWeather(country: searchController.text);
          AppCubit.get(context)
              .getSearchDaysWeather(country: searchController.text);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the city!';
        }

        return null;
      },
    );



Widget topBar(context) =>  Row(

  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: [

  Row(
    children: [
      Text(
        '${AppCubit.get(context).searchDailyWeatherModel?.name}',
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
      ),

      const Icon(
        Icons.location_on_outlined,
        color: Colors.white,

      ),


    ],
  ),


    IconButton(onPressed: (){
      CacheHelper.saveData(key: 'favoriteCity', value: searchController.text).then((value) {

        favoriteCity = CacheHelper.getData(key: 'favoriteCity');

        AppCubit.get(context).getFavoriteWeatherModel(country: favoriteCity ?? myCity);

        showToast(text: '${searchController.text} become your favorite city');

      });
    }, icon: const Icon(
      Icons.favorite,
      color: Colors.white,
    ) ),


],);




Widget firstContainer(context) => Container(
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${(AppCubit.get(context).searchDailyWeatherModel!.main!.temp! - 273.15).round().toString()}\u00B0',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 80),
        ),
        Column(
          children: [
            Text(
              '${(AppCubit.get(context).searchDailyWeatherModel!.main!.tempMin! - 273.15).round().toString()}\u00B0 / ${(AppCubit.get(context).searchDailyWeatherModel!.main!.tempMax! - 273.15).round().toString()}\u00B0',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 25),
            ),
            const SizedBox(height: 8),
            Text(
                '${AppCubit.get(context).searchDailyWeatherModel?.weather![0].description}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                )),
          ],
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
                model:
                    AppCubit.get(context).searchDaysWeatherModel!.list[index]),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 15.0,
                ),
            itemCount:
                AppCubit.get(context).searchDaysWeatherModel!.list.length),
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
                  model: AppCubit.get(context)
                      .searchDaysWeatherModel!
                      .list[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 3,
                  ),
              itemCount:
                  AppCubit.get(context).searchDaysWeatherModel!.list.length),
        ),
      ],
    ));
