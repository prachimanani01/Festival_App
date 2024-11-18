import 'package:flutter/material.dart';

Container bg_colorcontainer() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'BG Color',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}


//botton of backgrongposter
Container backgorund_poster_container() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'Poster',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}


//add_text_botton
Container add_text_container() {
  return Container(
    width: 130,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'Add Text',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}


Container alignment_container() {
  return Container(
    width: 130,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'Alignment',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

//font family botton
Container font_family_container() {
  return Container(
    width: 130,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'Font Family',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}


//font_color_botton
Container font_color_container() {
  return Container(
    width: 130,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'Font Color',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}