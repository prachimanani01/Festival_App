import 'package:festival_fest_app/view/edit_screen/edit_screen.dart';
import 'package:festival_fest_app/view/gotoedit_screen/gotoedit_screen.dart';
import 'package:festival_fest_app/view/home_screen/home_screen.dart';
import 'package:festival_fest_app/view/slashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => splesh_screen(),
        '/home':(context) => Home_screen(),
         '/gotoedit':(context) => gotoedit_screen(),
        '/edit':(context) => Edit_screen(),
      },
    );
  }
}






//draggable_widget: ^2.0.0
//text moving or moving widget;
// import 'package:draggable_widget/draggable_widget.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   final dragController = DragController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     dragController.showWidget();
//                   },
//                   child: Text("Show"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     dragController.hideWidget();
//                   },
//                   child: Text("Hide"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     dragController.jumpTo(AnchoringPosition.topRight);
//                   },
//                   child: Text("Move to Top Right"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     dragController.jumpTo(AnchoringPosition.topLeft);
//                   },
//                   child: Text("Move to Top Left"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     dragController.jumpTo(AnchoringPosition.bottomRight);
//                   },
//                   child: Text("Move to bottom Right"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     dragController.jumpTo(AnchoringPosition.bottomLeft);
//                   },
//                   child: Text("Move to Bottom Left"),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     dragController.jumpTo(AnchoringPosition.values[1]);
//                   },
//                   child: Text("Move to Center"),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 80,
//             width: double.infinity,
//             color: Colors.green,
//           ),
//           DraggableWidget(
//             bottomMargin: 80,
//             topMargin: 80,
//             intialVisibility: true,
//             horizontalSpace: 20,
//             shadowBorderRadius: 50,
//             child: Container(
//               height: 100,
//               width: 200,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Stack(
//                 children: [
//                   IconButton(icon: Icon(Icons.close), onPressed: () {})
//                 ],
//               ),
//             ),
//             initialPosition: AnchoringPosition.bottomLeft,
//             dragController: dragController,
//           )
//         ],
//       ),
//     );
//   }
// }
































////draggable_bottom_sheet: ^1.0.2


///draggable_bottom_sheet: ^1.0.2
///drage bottem sheet;
// import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   final List<IconData> icons = const [
//     Icons.message,
//     Icons.call,
//     Icons.mail,
//     Icons.notifications,
//     Icons.settings,
//   ];
//
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Builder(builder: (context) {
//         return Scaffold(
//           body: DraggableBottomSheet(
//             minExtent: 150,
//             useSafeArea: false,
//             curve: Curves.easeIn,
//             previewWidget: _previewWidget(),
//             expandedWidget: _expandedWidget(),
//             backgroundWidget: _backgroundWidget(),
//             maxExtent: MediaQuery.of(context).size.height * 0.8,
//             onDragging: (pos) {},
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _backgroundWidget() {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Draggable Bottom Sheet Example'),
//         backgroundColor: Colors.deepOrange,
//       ),
//       body: SizedBox(
//         height: 400,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.symmetric(vertical: 32),
//           itemCount: icons.length,
//           itemBuilder: (context, index) => Container(
//             height: 200,
//             width: MediaQuery.of(context).size.width * 0.7,
//             decoration: BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Icon(icons[index], color: Colors.white, size: 60),
//           ),
//           separatorBuilder: (context, index) => const SizedBox(width: 10),
//         ),
//       ),
//     );
//   }
//
//   Widget _previewWidget() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Colors.pink,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         children: <Widget>[
//           Container(
//             width: 40,
//             height: 6,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Drag Me',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: icons.map((icon) {
//                 return Container(
//                   width: 50,
//                   height: 50,
//                   margin: const EdgeInsets.only(right: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Icon(icon, color: Colors.pink, size: 40),
//                 );
//               }).toList())
//         ],
//       ),
//     );
//   }
//
//   Widget _expandedWidget() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Colors.pink,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         children: <Widget>[
//           const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white),
//           const SizedBox(height: 8),
//           const Text(
//             'Hey...I\'m expanding!!!',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: GridView.builder(
//               itemCount: icons.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) => Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Icon(icons[index], color: Colors.pink, size: 40),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }