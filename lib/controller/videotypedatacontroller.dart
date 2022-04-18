import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/dataservice/videotypedataservice.dart';
import 'package:get/get.dart';

class VideoTypeDataController extends GetxController {
  VideoTypeDataService videoTypeDataService = VideoTypeDataService();
  var videolist = [].obs;
  final _loading = false.obs;
  final _playarea = false.obs;
  get playarea => _playarea;
  get loading => _loading;
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void toggleplayareatotrue() {
    _playarea.value = true;
  }
  void toggleplayareatofalse() {
    _playarea.value = false;
  }


  _loadData() async {
    _loading.value = false;
    try {
      var info = videoTypeDataService.getVideo();
      videolist.addAll(await info);
    } catch (e) {
      debugPrint('encount an error');
    } finally {
      _loading.value = true;
    }
  }
}
