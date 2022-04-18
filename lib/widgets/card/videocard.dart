import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/components/colors.dart' as color;

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.timedetails,
    required this.videoimagespath,
    required this.videotype,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String videoimagespath;
  final String videotype;
  final String timedetails;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(videoimagespath),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 10,
                          spreadRadius: -5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '$videotype\n',
                        style: TextStyle(
                          color: color.AppColor.circuitsColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: timedetails,
                            style: TextStyle(
                              color: color.AppColor.setsColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: color.AppColor.setsColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      '15% rest',
                      style: TextStyle(
                        color: color.AppColor.homePageDetail,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (int i = 0; i < 80; i++)
                    Container(
                      margin: const EdgeInsets.only(top: 17),
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                          color: i.isEven ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(2)),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
