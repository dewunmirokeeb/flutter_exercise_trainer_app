import 'dart:convert';

import 'package:flutter/services.dart';

class VideoTypeDataService {
  Future<dynamic> getVideo() async {
    var videoinfo = rootBundle.loadString('json/videoinfo.json');
    List<dynamic> videolist = jsonDecode(await videoinfo);
    return Future.delayed(
        const Duration(seconds: 1), () => videolist.map((e) => e).toList());
  }
}
