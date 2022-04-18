import 'package:flutter/material.dart';
import '../components/colors.dart' as color;


homepagesecondheader({Function()? onTap}) {
  return Row(
    children: [
      Text(
        'Your Program',
        style: TextStyle(
          color: color.AppColor.homePageTitle,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      Expanded(child: Container()),
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                'Details',
                style: TextStyle(
                  color: color.AppColor.homePageDetail,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    ],
  );
}
