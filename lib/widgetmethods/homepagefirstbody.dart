import 'package:flutter/material.dart';
import '../components/colors.dart' as color;

homepagefirstbody({double? width, Function()? onTap}) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(60),
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
    ),
    child: Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 25,
        right: 20,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
          colors: [
            color.AppColor.gradientFirst.withOpacity(0.8),
            color.AppColor.gradientSecond.withOpacity(0.9),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 10),
            blurRadius: 40,
            spreadRadius: -23,
            color: color.AppColor.homePageIcons,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Next Workout\n',
              style: TextStyle(
                color: color.AppColor.homePageContainerTextSmall,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: 'Legs Toning \nand Glutes Workout',
                  style: TextStyle(
                    color: color.AppColor.homePageContainerTextBig,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: width! * 0.02,
                  ),
                  Text(
                    '60 min',
                    style: TextStyle(
                      color: color.AppColor.homePageContainerTextSmall,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 8),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
