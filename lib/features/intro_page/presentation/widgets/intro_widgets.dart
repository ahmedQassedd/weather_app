import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:weather/core/util/blocs/app_cubit/app_states.dart';
import 'package:weather/core/util/widgets/background.dart';
import 'package:weather/core/util/widgets/button.dart';
import 'package:weather/core/util/widgets/text_form_field.dart';


var countryController = TextEditingController();
var formKey = GlobalKey<FormState>();



Widget mainIntroWidget(context, state) => SafeArea(
  child:    Scaffold(

          body: Stack(

        alignment: Alignment.center,

        children: [

          background(),

          SingleChildScrollView(

            child: Padding(

                padding: const EdgeInsets.all(20),

                child: Form(

                  key: formKey,

                  child: Container(

                    padding: const EdgeInsets.all(40),

                    decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.circular(20)),

                    child: Column(

                      children: [

                        theTextFormField(),

                        const SizedBox(height: 20),

                        ConditionalBuilder(

                          condition: state is! LoadingDailyWeather,

                          builder: (context) => theButton(context),

                          fallback: (context) =>

                              const CircularProgressIndicator(),

                        ),

                      ],

                    ),

                  ),

                )),

          )

        ],

      )),
);







Widget theTextFormField() => defaultTextFormField(

  controller: countryController,

  inputType: TextInputType.text,

  hint: 'Insert Your City:',

  validator: (value) {

    if (value!.isEmpty) {

      return 'Please insert your city!';

    }

    return null;

  },

);




Widget theButton(context) => customButton(

    text: 'OK',

    color: Colors.grey,

    onPressed: () {

      if (formKey.currentState!.validate()) {

        AppCubit.get(context).getDailyWeather(

            country: countryController.text);

      }

    });