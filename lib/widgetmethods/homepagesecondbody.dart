import 'package:flutter/material.dart';
import '../components/colors.dart' as color;

homepagesecondbody(double width, double height) {
  return SizedBox(
    width: width,
    height: height * 0.2,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, bottom: 20),
          width: width,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/card.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
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
        ),
        Container(
          width: width * 0.4,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('assets/images/figure.png'),
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 150, top: 50),
          width: double.maxFinite,
          height: 100,
          child: RichText(
            text: TextSpan(
                text: 'You are doing great\n\n',
                style: TextStyle(
                  color: color.AppColor.homePageDetail,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'keep it up\nstick to your plan',
                    style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePagePlanColor,
                        fontWeight: FontWeight.normal),
                  ),
                ]),
          ),
        )
      ],
    ),
  );
}
