import 'package:flutter/material.dart';

Widget background () => Container(
  decoration: BoxDecoration(
    image: DecorationImage(
        image: {6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}
            .contains(DateTime.now().hour)
            ? const AssetImage('assets/day.jpg')
            : const AssetImage('assets/night.jpg'),
        fit: BoxFit.cover),
  ),
);