import 'dart:convert';

import 'package:flutter/services.dart';

class ExerciseTypeDataService {
  Future<dynamic>  getExercise() async {
    var exerciseinfo = rootBundle.loadString("json/info.json");
    List<dynamic> exerciselist = json.decode(await exerciseinfo);
    return Future.delayed(
        const Duration(seconds: 1), () => exerciselist.map((e) => e).toList());
  }
}
