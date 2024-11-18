import 'package:festival_fest_app/uitels/listoffest.dart';
import 'package:flutter/material.dart';

import '../../../uitels/variable_for_globle.dart';

GridView Grid_View() {
  return GridView.builder(itemCount: festlist.length,
    gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    physics: ScrollPhysics(),
    itemBuilder: (context, index) => festList1(
        festlist[index]['Color'],
        festlist[index]['Festival'],
        festlist[index]['word'],
        festlist[index]['Image'],index,context),);
}


Widget festList1(Color color, String name, String name2, String img,int index,BuildContext context) {
  return InkWell(
    onTap: () {
      Index = index;
      Navigator.of(context).pushNamed('/gotoedit');
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white)),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              child: Text(name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    ),
  );
}