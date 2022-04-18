import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/components/colors.dart' as color;
import 'package:flutter_exercise_trainer_app/controller/exercise_type_datacontroller.dart';
import 'package:flutter_exercise_trainer_app/screen/videoinfopage.dart';
import 'package:get/get.dart';
import '../widgetmethods/homepage_first_header.dart';
import '../widgetmethods/homepage_second_header.dart';
import '../widgetmethods/homepagefirstbody.dart';
import '../widgetmethods/homepagesecondbody.dart';
import '../widgets/pagewidget/homepage_exercise_focus_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final ExerciseTypeDataController _controller =
    Get.put(ExerciseTypeDataController());

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homepagefirstheader(width),
              SizedBox(
                height: height * 0.04,
              ),
              homepagesecondheader(onTap: (() {
                Get.to(() => const VideoInfoPage());
              })),
              SizedBox(
                height: height * 0.02,
              ),
              homepagefirstbody(width: width, onTap: () {}),
              homepagesecondbody(width, height),
              Text(
                'Area of Focus',
                style: TextStyle(
                  color: color.AppColor.homePageTitle,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx(
                  () {
                    return _controller.loading == false
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            cacheExtent: .85,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: [
                              for (int i = 0;
                                  i < _controller.exerciselist.length;
                                  i++)
                                HomePageExerciseFocusWidget(
                                  width: width,
                                  imagestring: _controller.exerciselist[i]
                                      ["img"],
                                  imagetext: _controller.exerciselist[i]
                                      ["title"],
                                ),
                            ],
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
