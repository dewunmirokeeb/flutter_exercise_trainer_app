import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/widgets/iconwidget/homepage_header_custom_iconbutto.dart';
import '../components/colors.dart' as color;

homepagefirstheader(double width) {
  return Row(
    children: [
      Text(
        'Training',
        style: TextStyle(
          color: color.AppColor.homePageTitle,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
      Expanded(child: Container()),
      AppCustomIconButton(
        icon: Icons.chevron_left,
        onTap: () {},
        color: color.AppColor.homePageIcons,
      ),
      SizedBox(
        width: width * 0.02,
      ),
      AppCustomIconButton(
        icon: Icons.calendar_today_outlined,
        onTap: () {},
        color: color.AppColor.homePageIcons,
      ),
      SizedBox(
        width: width * 0.02,
      ),
      AppCustomIconButton(
        icon: Icons.chevron_right,
        onTap: () {},
        color: color.AppColor.homePageIcons,
      )
    ],
  );
}
