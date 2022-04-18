import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/components/colors.dart' as color;

class AppStyledIcon2 extends StatelessWidget {
  const AppStyledIcon2({
    required this.icon,
    required this.icontext,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final Function() onTap;
  final String icontext;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
              colors: [
                color.AppColor.secondPageContainerGradient1stColor
                    .withOpacity(0.9),
                color.AppColor.secondPageContainerGradient2ndColor,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                icontext,
                style: TextStyle(
                  color: color.AppColor.homePageContainerTextSmall,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
