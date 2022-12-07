import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaddingConstants {
  static PaddingConstants instance = PaddingConstants._init();
  PaddingConstants._init();

  EdgeInsets paddingHorizontalNormal = EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04);
}
