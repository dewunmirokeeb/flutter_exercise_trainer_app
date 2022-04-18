import 'package:flutter/material.dart';
import 'package:flutter_exercise_trainer_app/dataservice/exercise_type_dataservice.dart';
import 'package:get/get.dart';

class ExerciseTypeDataController extends GetxController {
  ExerciseTypeDataService exerciseTypeDataService = ExerciseTypeDataService();
  var exerciselist = [].obs;
  final _loading = false.obs;
  get loading => _loading;
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    _loading.value = false;
    try {
      var info = exerciseTypeDataService.getExercise();
      exerciselist.addAll(await info);
    } catch (e) {
      debugPrint('encount an error');
    } finally {
      _loading.value = true;
    }
  }
}
