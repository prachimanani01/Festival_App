import 'package:festival_fest_app/uitels/listoffest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../uitels/variable_for_globle.dart';

class gotoedit_screen extends StatefulWidget {
  const gotoedit_screen({super.key});

  @override
  State<gotoedit_screen> createState() => _gotoedit_screenState();
}

class _gotoedit_screenState extends State<gotoedit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Festival App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff1E456C),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 1,
                            )
                          ],
                          color: Colors.black,
                        ),
                        child: Image.asset(
                          festlist[Index]['Image'],
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          edit_screenindex = 6;
                        });
                        Navigator.of(context).pushNamed('/edit');
                      },
                      child: Container(
                        height: 60,
                        width: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff1E456C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Edit Template',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 220,
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                    color: Color(0xfffcbd05),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(250, 250),
                        topRight: Radius.elliptical(200, 200))),
                child: Container(
                  height: 180,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color(0xff1E456C),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(250, 250),
                        topRight: Radius.elliptical(250, 250),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        'FestiVals',
                        style: GoogleFonts.rocknRollOne(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Create Your Template With us!!',
                        style: GoogleFonts.habibi(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
