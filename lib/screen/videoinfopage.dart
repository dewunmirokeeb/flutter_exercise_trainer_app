import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/controller/videotypedatacontroller.dart';
import 'package:flutter_exercise_trainer_app/widgets/card/defaultheadercard.dart';
import 'package:flutter_exercise_trainer_app/widgets/card/videocard.dart';
import 'package:flutter_exercise_trainer_app/widgets/iconwidget/appstyledicon_1.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../components/colors.dart' as color;

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({Key? key}) : super(key: key);

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

final VideoTypeDataController _controller = Get.put(VideoTypeDataController());

late VideoPlayerController _videoplayercontroller;

class _VideoInfoPageState extends State<VideoInfoPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    debugPrint('page rebuild = true');
    return Scaffold(
      body: Obx(
        () {
          return Container(
            width: width,
            height: height,
            decoration: _controller.playarea == true
                ? const BoxDecoration()
                : BoxDecoration(
                    gradient: LinearGradient(
                      begin: const FractionalOffset(0.0, 0.4),
                      end: Alignment.topRight,
                      colors: [
                        color.AppColor.secondPageContainerGradient1stColor,
                        color.AppColor.secondPageContainerGradient2ndColor,
                      ],
                    ),
                  ),
            child: Column(
              children: [
                _controller.playarea == true
                    ? Container(
                        padding: const EdgeInsets.only(
                          top: 50,
                          left: 20,
                          right: 20,
                        ),
                        width: width,
                        height: height * 0.35,
                        color: Colors.redAccent.withOpacity(0.7),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      _controller.toggleplayareatofalse();
                                    },
                                    child: Icon(
                                      Icons.chevron_left,
                                      size: 30,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : DefaultVideoPageHeaderCard(width: width, height: height),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(right: 25, top: 30, left: 25),
                    width: width,
                    decoration: BoxDecoration(
                      color: color.AppColor.secondPageTitleColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Circuit 1: Legs Toning',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: color.AppColor.homePageSubtitle,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppStyledIcon(
                                    icon: Icons.loop,
                                    onTap: () {},
                                    color: color.AppColor.loopColor,
                                  ),
                                  Text(
                                    '3 sets',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: color.AppColor.setsColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: _controller.loading == false
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount: _controller.videolist.length,
                                    itemBuilder: (context, index) {
                                      return VideoCard(
                                        onTap: () {
                                          _onTapVideo(int index) {
                                            final controller =
                                                VideoPlayerController.network(
                                                    _controller.videolist[index]
                                                        ["videoUr"]);

                                            _videoplayercontroller = controller;
                                            controller.initialize().then((_) {
                                              controller.play();
                                            });

                                            debugPrint('video $index tapped');
                                          }

                                          _controller.toggleplayareatotrue();
                                          debugPrint('play area is now ' +
                                              _controller.playarea.toString());
                                          _onTapVideo(index);
                                        },
                                        timedetails: _controller
                                            .videolist[index]["time"],
                                        videoimagespath: _controller
                                            .videolist[index]["thumbnail"],
                                        videotype: _controller.videolist[index]
                                            ["title"],
                                      );
                                    },
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
