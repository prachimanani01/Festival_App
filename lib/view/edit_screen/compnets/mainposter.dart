import 'package:flutter/material.dart';

import '../../../uitels/colorlist.dart';
import '../../../uitels/font.dart';
import '../../../uitels/listoffest.dart';
import '../../../uitels/variable_for_globle.dart';
import '../edit_screen.dart';

Expanded mainposterwidget() {
  return Expanded(child: SingleChildScrollView(
    child: Container(
      alignment: Alignment.center,
      child:  RepaintBoundary(
        key: imgkey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.5,
                      spreadRadius: 1,
                    )
                  ],
                  color: (!isImageandColor && backgroundcolorindex == 0)
                      ? color
                      : null,
                  gradient:
                  (!isImageandColor && backgroundcolorindex > 0)
                      ? LinearGradient(
                    colors: colorgrid[backgroundcolorindex],
                  )
                      : null,
                ),
                child: Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: (isImageandColor)
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            festlist[Index]['images']
                            [backgroungindex],
                            fit: BoxFit.fitWidth,
                          ),
                        )
                            : null),
                    Positioned(
                        top: top,
                        bottom: bottem,
                        left: left,
                        right: right,
                        child: Container(
                            height: 300,
                            width: 300,
                            child: Text(
                                txtname.text,
                                style: family[fontindex](
                                  fontSize: fontofsize,
                                  color: Colorlist[textcolorindex],
                                )
                              //TextStyle(
                              //     fontSize: fontofsize,
                              //     color: Colorlist[textcolorindex],
                              //
                              // ),
                            )))
                  ],
                ))
          ],
        ),
      ),
    ),
  ),
  );
}