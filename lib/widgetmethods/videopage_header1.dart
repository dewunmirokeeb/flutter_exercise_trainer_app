import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/widgets/iconwidget/appstyledicon_1.dart';
import 'package:get/get.dart';

videoheader1() {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20 ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppStyledIcon(
          icon: Icons.chevron_left,
          size: 30,
          onTap: () {
            Get.back();
          },
        ),
        AppStyledIcon(
          icon: Icons.info_outline,
          onTap: () {},
        )
      ],
    ),
  );
}
