// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/pages/canli_yayin.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/service/auth_register.dart';

// import '../constants/color_constants.dart';
// import '../constants/sizedbox_constants.dart';
// import '../constants/string_detail_constants.dart';

// class SelectedCardDesign extends StatefulWidget {
//   const SelectedCardDesign({super.key, required this.dersadi, required this.ogretmenisim, required this.dersid});

//   final String dersadi;
//   final String ogretmenisim;
//   final String dersid;
//   @override
//   State<SelectedCardDesign> createState() => _SelectedCardDesignState();
// }

// class _SelectedCardDesignState extends State<SelectedCardDesign> {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   AuthService authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: ColorConstants.instance.hippieGreenLight8x,
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//         child: ListTile(
//           title: Row(
//             children: [
//               SizedBox(
//                 width: Get.width * 0.65,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.ogretmenisim,
//                       style: TextStyle(
//                         fontWeight: StringDetailConstants.instance.textWeightBold,
//                         fontSize: StringDetailConstants.instance.buttonBigSize,
//                       ),
//                     ),
//                     SizedBox(
//                       height: SizedboxConstans.instance.spaceSmall / 1.5,
//                     ),
//                     Text(
//                       widget.dersadi,
//                       style: TextStyle(
//                         fontWeight: StringDetailConstants.instance.textWeightSemiBold,
//                         fontSize: StringDetailConstants.instance.textFieldSize,
//                       ),
//                     ),
//                     SizedBox(
//                       height: SizedboxConstans.instance.spaceSmall / 5,
//                     ),
//                     Text(
//                       "10.08.2022   17:30 - 18.30",
//                       style: TextStyle(
//                         fontWeight: StringDetailConstants.instance.titleWeight,
//                         fontSize: StringDetailConstants.instance.textFieldSize / 1.1,
//                       ),
//                     ),
//                     SizedBox(
//                       height: SizedboxConstans.instance.spaceSmall / 2,
//                     ),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           style: ButtonStyle(
//                               elevation: MaterialStateProperty.all(3),
//                               backgroundColor: MaterialStateProperty.all(ColorConstants.instance.hippieGreen),
//                               shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
//                           onPressed: (() {
//                             Get.to(const CanliYayin());
//                           }),
//                           child: Padding(
//                             padding: const EdgeInsets.all(2),
//                             child: Text(
//                               "Derse Katıl",
//                               style: TextStyle(fontSize: Get.width * 0.04, letterSpacing: 2),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: Get.width * 0.03,
//                         ),
//                         ElevatedButton(
//                           style: ButtonStyle(
//                               elevation: MaterialStateProperty.all(3),
//                               backgroundColor: MaterialStateProperty.all(ColorConstants.instance.crimson),
//                               shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
//                           onPressed: (() {
//                             firestore.collection('dersler').doc(widget.dersid).update({
//                               'dersalindimi': false,
//                             });
//                             firestore
//                                 .collection('Person')
//                                 .doc(authService.infouser())
//                                 .collection('alinacakdersler')
//                                 .doc(widget.dersid)
//                                 .delete();
//                             // DerslerimPage().lis
//                           }),
//                           child: Padding(
//                             padding: const EdgeInsets.all(2),
//                             child: Text(
//                               "İptal Et",
//                               style: TextStyle(fontSize: Get.width * 0.04, letterSpacing: 2),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Image.asset(
//                     "assets/images/insan.png",
//                     fit: BoxFit.cover,
//                     height: 80,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
