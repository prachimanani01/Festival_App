import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:festival_fest_app/uitels/listoffest.dart';
import 'package:festival_fest_app/view/edit_screen/compnets/mainposter.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../uitels/colorlist.dart';
import '../../uitels/font.dart';
import '../../uitels/variable_for_globle.dart';
import 'compnets/all_container.dart';
import 'compnets/fontstyle.dart';

class Edit_screen extends StatefulWidget {
  const Edit_screen({super.key});

  @override
  State<Edit_screen> createState() => _Edit_screenState();
}

GlobalKey imgkey = GlobalKey();

class _Edit_screenState extends State<Edit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff1E456C),
        centerTitle: true,
        title: Text(
          'Edit page',
          style: GoogleFonts.meeraInimai(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      bottomNavigationBar: bottomnavigator(),
      body: Column(
        children: [
          mainposterwidget(),
          IndexedStack(
            index: edit_screenindex,
            children: [
              Post(), //0
              font(), //1
              Container(
                height: 100,
              ), //2
              Container(
                height: 100,
              ), //3
              background(), //4
              backgroundcolors(), //5
              Container(), //6
              alignment(), //7
              textfild_font(), //8
              color_font(), //9
              fontfamilys(),
            ],
          ),
        ],
      ),
    );
  }

  Container fontfamilys() {
    //10
    return Container(
      height: 255,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color(0xff1c2438),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              looktext(),
              InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 1;
                    });
                  },
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          Divider(),
          Container(
            height: 175,
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                      family.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  fontindex = index;
                                });
                              },
                              child: goglefonts(index),
                            ),
                          ))),
            ),
          )
        ],
      ),
    );
  }

  Container color_font() {
    return Container(
      height: 255,
      decoration: const BoxDecoration(
          color: Color(0xff1c2438),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Edit Your Text color',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        edit_screenindex = 1;
                      });
                    },
                    child: const Icon(
                      Icons.done,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            GridView.builder(
              itemCount: Colorlist.length,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    textcolorindex = index;
                    (index == 0)
                        ? showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Pick your color'),
                                  content: Container(
                                    height: 500,
                                    width: 300,
                                    child: ColorPicker(
                                      color: color,
                                      onChanged: (value) {
                                        setState(() {
                                          color = value;
                                          backgroundcolorindex = index;
                                          isImageandColor = false;
                                        });
                                      },
                                      initialPicker: Picker.paletteHue,
                                    ),
                                  ),
                                  actions: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("save"))
                                  ],
                                ))
                        : null;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colorlist[index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container textfild_font() {
    return Container(
      height: 255,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Edit Your Text',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      TextEditingControllerlist.add(txtname.text);
                      edit_screenindex = 1;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            controller: txtname,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )),
          )
        ],
      ),
    );
  }

  Container Post() // 0
  {
    return Container(
      height: 255,
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Change Background Image And Color',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 6;
                    });
                  },
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 4;
                  });
                },
                child: backgorund_poster_container(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 5;
                  });
                },
                child: bg_colorcontainer(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container font() {
    //1
    return Container(
      height: 255,
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Edit Your Text Here!!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 6;
                    });
                  },
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 8;
                  });
                },
                child: add_text_container(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 7;
                  });
                },
                child: alignment_container(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 10;
                  });
                },
                child: font_family_container(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 9;
                  });
                },
                child: font_color_container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container background() {
    //4
    return Container(
      height: 255,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Background',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 0;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                festlist[Index]['images'].length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      isImageandColor = true;
                      backgroungindex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 1,
                            )
                          ],
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            festlist[Index]['images'][index],
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container backgroundcolors() {
    //5
    return Container(
      height: 255,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Background Color',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 0;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                colorgrid.length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      isImageandColor = false;
                      backgroundcolorindex = index;
                      (index == 0)
                          ? showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Pick your color'),
                                    content: Container(
                                      height: 500,
                                      width: 300,
                                      child: ColorPicker(
                                        color: color,
                                        onChanged: (value) {
                                          setState(() {
                                            color = value;
                                            backgroundcolorindex = index;
                                            isImageandColor = false;
                                          });
                                        },
                                        initialPicker: Picker.paletteHue,
                                      ),
                                    ),
                                    actions: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("save"))
                                    ],
                                  ))
                          : null;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 1,
                            )
                          ],
                          color: (index == 0) ? color : null,
                          gradient: (index > 0)
                              ? LinearGradient(colors: colorgrid[index])
                              : null),
                      child: (index == 0)
                          ? const Icon(
                              Icons.add,
                              size: 50,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container alignment() {
    //6
    return Container(
      height: 255,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Edit Your Font Style',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 1;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Alignament',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          bottem += 7;
                          top -= 7;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xff1c2438),
                          ),
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              right += 7;
                              left -= 7;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Icon(
                              Icons.arrow_left_sharp,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 38,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              right -= 7;
                              left += 7;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Icon(
                              Icons.arrow_right,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          top += 7;
                          bottem -= 7;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xff1c2438),
                          ),
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 38.0),
                      child: Text(
                        'Font size',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              fontofsize++;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Text(
                              'A+',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              fontofsize--;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Text(
                              'A-',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container bottomnavigator() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
        color: Color(0xff1E456C),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                edit_screenindex = 0;
              });
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.draw,
                  color: Colors.white,
                ),
                Text(
                  'Canvas',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                edit_screenindex = 1;
              });
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.text_fields,
                  color: Colors.white,
                ),
                Text(
                  'Text',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() async {
                RenderRepaintBoundary? boundray = imgkey.currentContext!
                    .findRenderObject() as RenderRepaintBoundary;
                ui.Image image = await boundray.toImage();
                ByteData? bytedata =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                imgdata = bytedata!.buffer.asUint8List();
                ImageGallerySaver.saveImage(imgdata!,
                    name: 'poster', quality: 100);
              });
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() async {
                final directory = await getApplicationDocumentsDirectory();
                File fileImage =
                    await File('${directory.path}/img.png').create();
                fileImage.writeAsBytesSync(imgdata!);
                await ShareExtend.share(fileImage.path, 'festival');
              });
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                Text(
                  'Share',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
