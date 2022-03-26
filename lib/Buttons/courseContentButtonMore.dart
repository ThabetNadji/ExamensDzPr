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

    return Container(
      margin: EdgeInsets.all(8),
      child:
          // ignore: deprecated_member_use
          RaisedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => viewpdf));
        },
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 1)),
        padding: EdgeInsets.all(1.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF233329),
                  const Color(0xFF63d471),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(00.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 170.0, minHeight: 30.0),
            alignment: Alignment.center,
            child: Text(
              link,
              style: TextStyle(
                fontFamily: 'Kufi',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
