import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../constants/sizedbox_constants.dart';
import '../constants/string_detail_constants.dart';

class EnterLesson extends StatefulWidget {
  const EnterLesson({super.key});

  @override
  State<EnterLesson> createState() => _EnterLessonState();
}

class _EnterLessonState extends State<EnterLesson> {
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/ogrenciden_logo_png.png",
                height: Get.height * 0.05,
              ),
            )
          ],
        ),
        body: Card(
          color: ColorConstants.instance.hippieGreenLight8x,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Onur Doğan",
                              style: TextStyle(
                                fontWeight: StringDetailConstants.instance.textWeightBold,
                                fontSize: StringDetailConstants.instance.buttonBigSize,
                              ),
                            ),
                            SizedBox(
                              height: SizedboxConstans.instance.spaceSmall,
                            ),
                            Text(
                              "Yazılım Geçerleme ve Sınama",
                              style: TextStyle(
                                fontWeight: StringDetailConstants.instance.textWeightSemiBold,
                                fontSize: StringDetailConstants.instance.textFieldSize,
                              ),
                            ),
                            SizedBox(
                              height: SizedboxConstans.instance.spaceSmall / 2,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/insan.jpg",
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          SizedBox(
                            height: SizedboxConstans.instance.spaceSmall / 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizedboxConstans.instance.spaceSmall,
                  ),
                  const Text(
                      "Bu ders içeriğinde bir uygulamanın nasıl yapıldığını göstererek uygulamayı baştan tasarlayarak geliştirme ve pazarlama aşamasına kadar olan süreç anlatılır."),
                  SizedBox(
                    height: SizedboxConstans.instance.spaceSmall / 2,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: _selectTime,
                          child: Text(
                            'Saati Seç: ${_time.format(context)}',
                            style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: _selectDate,
                          child: Text(
                            'Tarihi Seç: ${_date.day}.${_date.month}.${_date.year}',
                            style: TextStyle(fontSize: StringDetailConstants.instance.textFieldSize),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: SizedboxConstans.instance.spaceSmall / 2,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(3),
                        backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
                        shape:
                            MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                    onPressed: (() {
                      Get.to(const EnterLesson());
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Derse Katıl",
                        style: TextStyle(fontSize: Get.width * 0.05, letterSpacing: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
