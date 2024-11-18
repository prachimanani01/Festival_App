import 'package:flutter/material.dart';

import '../../../uitels/font.dart';

Text goglefonts(int index) {
  return Text(
    "Enjoy the festival with family",
    style: family[index](
        fontSize: 20.0,
        color: Colors.white),
  );
}
Text looktext() {
  return Text(
    'Chosse fontfamily',
    style: TextStyle(color: Colors.white, fontSize: 25),
  );
}