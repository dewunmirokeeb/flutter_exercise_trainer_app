import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/widgets/iconwidget/appstyledicon_2.dart';

videoheader2() {
  return Container(
    margin: const EdgeInsets.only(left: 25),
    child: Row(
      children: [
        AppStyledIcon2(
          onTap: () {},
          icon: Icons.timer,
          icontext: '68 min',
        ),
        const SizedBox(
          width: 30,
        ),
        AppStyledIcon2(
          icon: Icons.handyman_outlined,
          icontext: 'Resistent band, kettle ball',
          onTap: () {},
        )
      ],
    ),
  );
}
