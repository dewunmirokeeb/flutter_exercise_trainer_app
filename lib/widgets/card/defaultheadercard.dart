import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/components/colors.dart' as color;
import 'package:flutter_exercise_trainer_app/widgetmethods/videopage_header1.dart';
import 'package:flutter_exercise_trainer_app/widgetmethods/videopageheader2.dart';

class DefaultVideoPageHeaderCard extends StatelessWidget {
  const DefaultVideoPageHeaderCard({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      width: width,
      height: height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          videoheader1(),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Legs Toning \nand Glutes Workout',
                style: TextStyle(
                  color: color.AppColor.homePageContainerTextBig,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Spacer(),
          videoheader2(),
          const Spacer(),
        ],
      ),
    );
  }
}
