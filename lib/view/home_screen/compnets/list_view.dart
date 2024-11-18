import 'package:flutter/material.dart';

import '../../../uitels/listoffest.dart';
import '../../../uitels/variable_for_globle.dart';



ListView List_view() {
  return ListView.builder(
    itemBuilder: (context, index) =>
        festLIST(
            festlist[index]['Color'], festlist[index]['Festival'],
            festlist[index]['word'], festlist[index]['Image'], index,
            context),
    itemCount: festlist.length,
  );
}

Widget festLIST(Color color,String name,String name2,String img,int index,BuildContext context) {
  return InkWell(
    onTap: () {
      Index = index;
      Navigator.of(context).pushNamed('/gotoedit');
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(right: 10,left: 18.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(color: Colors.black12,width: 0.7)
                ),
                child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(img,fit: BoxFit.cover,)),
              ),
            ),
            SizedBox(
              width: 270,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                    Text(name2,overflow: TextOverflow.clip,style: const TextStyle(fontSize: 13,color: Colors.white),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}