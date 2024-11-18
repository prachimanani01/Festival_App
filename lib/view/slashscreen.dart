import 'dart:async';

import 'package:flutter/material.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({super.key});

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
          child: Image(
        image: NetworkImage(
            "https://thumbs.dreamstime.com/b/creative-festival-logo-design-vector-art-logo-creative-clever-festival-logo-design-various-used-purposed-just-you-126660288.jpg"),
      )),
    );
  }
}
