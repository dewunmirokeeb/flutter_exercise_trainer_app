import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/components/colors.dart' as color;

class HomePageExerciseFocusWidget extends StatelessWidget {
  const HomePageExerciseFocusWidget({
    Key? key,
    required this.width,
    required this.imagestring,
    required this.imagetext,
  }) : super(key: key);

  final double width;
  final String imagestring;
  final String imagetext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: width * 0.4,
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagestring),
          const SizedBox(
            height: 5,
          ),
          Text(
            imagetext,
            style: TextStyle(
              color: color.AppColor.homePageTitle,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: 3,
            color: color.AppColor.gradientSecond.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(-5, -5),
            blurRadius: 3,
            // spreadRadius: -23,
            color: color.AppColor.gradientSecond.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
