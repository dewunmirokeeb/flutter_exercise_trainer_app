import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/components/colors.dart' as colorr;

class AppStyledIcon extends StatelessWidget {
  const AppStyledIcon({
    required this.icon,
    required this.onTap,
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final Function() onTap;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        size: size ?? 25,
        color: color ?? colorr.AppColor.secondPageTopIconColor,
      ),
    );
  }
}
