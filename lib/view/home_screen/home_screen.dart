import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../uitels/variable_for_globle.dart';
import 'compnets/grid_view.dart';
import 'compnets/list_view.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          shadowColor: const Color(0xff1c2438),
          centerTitle: true,
          title: Text(
            "Festival App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color(0xff1E456C),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  islist = !islist;
                });
              },
              child: Icon(
                (!islist) ? Icons.list : Icons.grid_view,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
      body: Center(child: (islist) ? List_view() : Grid_View()),
    );
  }
}
