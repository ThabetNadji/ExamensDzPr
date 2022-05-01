import 'dart:convert';
import 'package:flutter/material.dart';

import '../PDFreader/Viewpdf.dart';

// ignore: must_be_immutable
class CourseContentButtonMore extends StatelessWidget {
  Viewpdf viewpdf;
  String titleBtn;
  CourseContentButtonMore(this.viewpdf, this.titleBtn);

  @override
  Widget build(BuildContext context) {
    String link;
    try {
      link = titleBtn.split("/")[4];
      link = link.substring(0, link.indexOf('.pdf'));
    } catch (e) {
      print(e);
    }

    return Column(children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 22, 133, 66),
          onPrimary: const Color(0xFF63d471),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => viewpdf));
        },
        child: Ink(
          child: Container(
            width: MediaQuery.of(context).size.height * 0.25,
            height: MediaQuery.of(context).size.height * 0.08,
            alignment: Alignment.center,
            child: Text(
              link,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Kufi',
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ]
        // ignore: deprecated_member_use

        );
  }
}
