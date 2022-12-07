import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StringDetailConstants {
  static StringDetailConstants instance = StringDetailConstants._init();
  StringDetailConstants._init();

  double titleSize = Get.width * 0.06;
  double buttonBigSize = Get.width * 0.05;
  double textFieldSize = Get.width * 0.04;
  double textSizeSmall = Get.width * 0.03;
  FontWeight titleWeight = FontWeight.w500;
  FontWeight textWeightSemiBold = FontWeight.w600;
  FontWeight textWeightBold = FontWeight.w800;

  EdgeInsets titlePadding = EdgeInsets.symmetric(horizontal: Get.width * 0.05);
  TextAlign titleAlign = TextAlign.center;
}
