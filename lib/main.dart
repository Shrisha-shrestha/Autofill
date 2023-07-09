import 'package:autofill/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// import 'package:flutter/material.dart';

// void main() => runApp(AnimatedContainerApp());

// class AnimatedContainerApp extends StatefulWidget {
//   @override
//   _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
// }

// class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
//   double margin1 = 0.0, margin2 = 0.0, height1 = 0.0, height2 = 0.0;

//   BorderRadiusGeometry bRG1 = const BorderRadius.all(Radius.circular(12.0));
//   BorderRadiusGeometry bRG2 = const BorderRadius.all(Radius.circular(12.0));
//   BorderRadiusGeometry bRG3 = const BorderRadius.all(Radius.circular(12.0));
//   int isSelected = -1;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: Container(
//         height: 760.0,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.grey[200],
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 24.0),
//               child: Column(children: [
//                 Text(
//                   'Select Preferred Job Location',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFF0C0D0D),
//                     fontSize: 18,
//                     fontFamily: 'Mukta',
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'Rorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFF636469),
//                     fontSize: 12,
//                     fontFamily: 'Noto Sans',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ]),
//             ),
//             Stack(
//               children: [
//                 AnimatedContainer(
//                   margin: EdgeInsets.only(top: margin2),
//                   duration: const Duration(seconds: 1),
//                   curve: Curves.easeOutCirc,
//                   child: CustomLocationWidget(
//                     height: 0.0,
//                     bRG: bRG3,
//                     loctionType: 'Municipality / VDC',
//                     locationValue: 'Bagamti province',
//                   ),
//                 ),
//                 AnimatedContainer(
//                   margin: EdgeInsets.only(top: margin1),
//                   duration: const Duration(seconds: 1),
//                   curve: Curves.easeOutCirc,
//                   child: CustomLocationWidget(
//                     height: height2,
//                     bRG: bRG2,
//                     loctionType: 'District',
//                     locationValue: 'Kathmandu',
//                   ),
//                 ),
//                 CustomLocationWidget(
//                   height: height1,
//                   bRG: bRG1,
//                   loctionType: 'Provice',
//                   locationValue: 'Bagamti province',
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Select Province',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'Mukta',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(12.0)),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             isSelected = index;
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: isSelected == index
//                                   ? const Color(0xFFF19541).withOpacity(0.4)
//                                   : Colors.white,
//                               border: const Border(
//                                 bottom: BorderSide(
//                                     color: Color.fromRGBO(202, 203, 206, 0.4),
//                                     width: 1),
//                               )),
//                           // color: Colors.amber,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 10.0),
//                           child: const Text(
//                             'Madhesh Province',
//                             style: TextStyle(
//                               color: Color(0xFF4A4B4F),
//                               fontSize: 16,
//                               fontFamily: 'Mukta',
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   margin1 = 44.0;
//                   height1 = 45.0;
//                   bRG1 = const BorderRadius.vertical(
//                     top: Radius.circular(12),
//                     bottom: Radius.circular(0),
//                   );
//                   bRG2 = const BorderRadius.vertical(
//                     top: Radius.circular(0),
//                     bottom: Radius.circular(0),
//                   );
//                 });
//               },
//               child: const Text('District'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   margin2 = 88.0;
//                   height2 = 45.0;

//                   bRG3 = const BorderRadius.vertical(
//                     top: Radius.circular(0),
//                     bottom: Radius.circular(12),
//                   );
//                 });
//               },
//               child: const Text('VDC'),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

// class CustomLocationWidget extends StatelessWidget {
//   const CustomLocationWidget(
//       {super.key,
//       required this.loctionType,
//       required this.locationValue,
//       required this.bRG,
//       required this.height});
//   final String locationValue;
//   final String loctionType;
//   final BorderRadiusGeometry bRG;
//   final double height;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       ClipRRect(
//         borderRadius: bRG,
//         child: Container(
//           height: 44,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                 top: BorderSide(
//                     color: Color.fromRGBO(202, 203, 206, 0.4), width: 1),
//               )),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(width: 38),
//               Expanded(
//                 child: SizedBox(
//                   child: Text(
//                     loctionType,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: Color(0xFF636469),
//                       fontSize: 16,
//                       fontFamily: 'Mukta',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: Text(
//                   locationValue,
//                   style: const TextStyle(
//                     color: Color(0xFF4A4B4F),
//                     fontSize: 16,
//                     fontFamily: 'Mukta',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const Icon(Icons.keyboard_arrow_right_outlined)
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 16.0, top: 18.0),
//         child: Stack(alignment: Alignment.topCenter, children: [
//           AnimatedContainer(
//             width: 2.0,
//             height: height,
//             decoration: const BoxDecoration(
//               color: Color(0xFFF19541),
//             ),
//             duration: const Duration(seconds: 1),
//             curve: Curves.easeOutCirc,
//           ),
//           Container(
//             width: 10,
//             height: 10,
//             decoration: const ShapeDecoration(
//               color: Color(0xFFF19541),
//               shape: OvalBorder(),
//             ),
//           ),
//         ]),
//       ),
//     ]);
//   }
// }
