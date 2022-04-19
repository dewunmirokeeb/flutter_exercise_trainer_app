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

VideoPlayerController? _videoplayercontroller;
int? isplayingindex;
final nomute = (_videoplayercontroller?.value.volume ?? 0) > 0;

class _VideoInfoPageState extends State<VideoInfoPage> {
  @override
  void dispose() {
    _videoplayercontroller!.pause();
    _videoplayercontroller!.dispose();
    _videoplayercontroller = null;
    super.dispose();
  }

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
                        padding: EdgeInsets.only(
                          top: 30,
                          left: _controller.playarea == true ? 0 : 20,
                          right: _controller.playarea == true ? 0 : 20,
                        ),
                        color: const Color.fromARGB(255, 99, 68, 238)
                            .withOpacity(0.7),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Row(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        _controller.toggleplayareatofalse();
                                        if (_videoplayercontroller!
                                            .value.isPlaying) {
                                          _videoplayercontroller!.pause();
                                        }
                                      },
                                      child: Icon(
                                        Icons.chevron_left,
                                        size: 30,
                                        color:
                                            color.AppColor.secondPageIconColor,
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
                                        color:
                                            color.AppColor.secondPageIconColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            playview(context, width, height),
                            controlview(context),
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
                                          _onTapVideo(index);

                                          _controller.toggleplayareatotrue();
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

  _onTapVideo(int index) {
    _controller.togglecheckvideotofalse();
    final controller =
        VideoPlayerController.network(_controller.videolist[index]["videoUrl"]);
    final old = _videoplayercontroller;
    if (old != null) {
      old.pause();
    }
    _videoplayercontroller = controller;

    _videoplayercontroller!.initialize().then((_) {
      old!.dispose();
      isplayingindex = index;
      _videoplayercontroller!.play();
      _controller.togglecheckvideototrue();
      _controller.toggleisplayingtotrue();
      // debugPrint(_videoplayercontroller!.value.duration.toString());
    });

    debugPrint('video $index isplaying');
  }

  Widget playview(BuildContext context, double width, double height) {
    final controller = _videoplayercontroller;
    return _controller.chechifvideoisinitialised == true
        ? AspectRatio(
            aspectRatio: 16 / 10,
            child: VideoPlayer(controller!),
          )
        : const AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  controlview(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () async {
            if (nomute) {
              _videoplayercontroller!.setVolume(0);
            } else {
              _videoplayercontroller!.setVolume(1);
            }
          },
          icon: Icon(
            nomute ? Icons.volume_up : Icons.volume_off,
            size: 36,
            color: Colors.white,
          ),
          label: const Text(
            '',
          ),
        ),
        TextButton.icon(
          onPressed: () async {
            if (isplayingindex == 0 ||
                isplayingindex == null ||
                _controller.videolist.isEmpty) {
              Get.snackbar(
                "video list",
                "no more videos in the list",
                snackPosition: SnackPosition.TOP,
                icon: const Icon(
                  Icons.face,
                  size: 30,
                  color: Colors.white,
                ),
                backgroundColor: color.AppColor.gradientSecond,
                colorText: Colors.white,
                maxWidth: 200,
              );
            } else {
              _onTapVideo(isplayingindex! - 1);
            }
          },
          icon: const Icon(
            Icons.fast_rewind,
            size: 36,
            color: Colors.white,
          ),
          label: const Text(
            '',
          ),
        ),
        TextButton.icon(
          onPressed: () async {
            if (_controller.isplaying == true) {
              if (_videoplayercontroller!.value.isPlaying) {
                _videoplayercontroller!.pause();
                _controller.toggleisplayingtofalse();
              } else {
                _onTapVideo(isplayingindex!);
              }
            } else {
              if (_videoplayercontroller!.value.isPlaying == false) {
                _videoplayercontroller!.play();
                _controller.toggleisplayingtotrue();
              } else {
                _onTapVideo(isplayingindex!);
              }
            }
          },
          icon: Icon(
            _controller.isplaying == false ||
                    _videoplayercontroller!.value.isPlaying == false
                ? Icons.play_arrow
                : Icons.pause,
            size: 36,
            color: Colors.white,
          ),
          label: const Text(
            '',
          ),
        ),
        TextButton.icon(
          onPressed: () async {
            if (isplayingindex! + 1 == _controller.videolist.length) {
              Get.snackbar(
                "video list",
                "Session completed... congrats !",
                snackPosition: SnackPosition.TOP,
                icon: const Icon(
                  Icons.face,
                  size: 30,
                  color: Colors.white,
                ),
                backgroundColor: color.AppColor.gradientSecond,
                colorText: Colors.white,
                maxWidth: 200,
              );
            } else {
              _onTapVideo(isplayingindex! + 1);
            }
          },
          icon: const Icon(
            Icons.fast_forward,
            size: 36,
            color: Colors.white,
          ),
          label: const Text(
            '',
          ),
        ),
      ],
    );
  }
}
