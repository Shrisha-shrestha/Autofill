import 'package:autofill/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Demo()));
// }

// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);

//   @override
//   DemoState createState() => DemoState();
// }

// class DemoState extends State {
//   final double indicatorWidth = 300;
//   final double indicatorHeight = 300.0;

//   final LayerLink layerLink = LayerLink();
//   OverlayEntry? overlayEntry;
//   Offset indicatorOffset = const Offset(0, 0);

//   Offset getIndicatorOffset() {
//     const double x = 00;
//     const double y = 50;
//     return const Offset(x, y);
//   }

//   void showIndicator() {
//     indicatorOffset = getIndicatorOffset();
//     overlayEntry = OverlayEntry(
//       builder: (BuildContext context) {
//         return Material(
//           child: SizedBox(
//               width: indicatorWidth,
//               height: indicatorHeight,
//               child: CompositedTransformFollower(
//                 offset: indicatorOffset,
//                 link: layerLink,
//                 child: Container(
//                   color: Colors.white70,
//                   // child:Column(children:List.generate(5, (index) => Text(index.toString())),)
//                 ),
//               )),
//         );
//       },
//     );
//     Overlay.of(context).insert(overlayEntry!);
//   }

//   void hideIndicator() {
//     overlayEntry?.remove();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           ' CompositedTransformFollower ',
//         ),
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.teal[400],
//       ),
//       body: Center(
//         child: SizedBox(
//           height: 50.0,
//           width: 300.0,
//           child: CompositedTransformTarget(
//             link: layerLink,
//             child: TextField(
//               decoration: const InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
//               onTap: showIndicator,
//               onTapOutside: (event) => hideIndicator(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
