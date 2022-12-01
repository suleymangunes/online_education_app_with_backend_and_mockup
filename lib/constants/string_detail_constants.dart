import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StringDetailConstants {
  static StringDetailConstants instance = StringDetailConstants._init();
  StringDetailConstants._init();

  double titleSize = Get.width * 0.06;
  FontWeight titleWeight = FontWeight.w500;
  EdgeInsets titlePadding = EdgeInsets.symmetric(horizontal: Get.width * 0.05);
  TextAlign titleAlign = TextAlign.center;
}
