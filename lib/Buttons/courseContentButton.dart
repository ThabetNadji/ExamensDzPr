import 'package:flutter/material.dart';
import '../PDFreader/Viewpdf.dart';

// ignore: must_be_immutable
class CourseContentButton extends StatelessWidget {
  Viewpdf viewpdf;
  String titleBtn, yearX;
  CourseContentButton(this.viewpdf, this.titleBtn, this.yearX);

  @override
  Widget build(BuildContext context) {
    String link;
    try {
      if (yearX != '') {
        link = titleBtn.split("/")[3]; // and 5 and 6
        link = link.substring(0, link.indexOf('.pdf'));
      }
      //link = titleBtn.split("/")[5]; // and 5 and 6

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
            side: BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
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
            constraints: BoxConstraints(maxWidth: 170.0, minHeight: 60.0),
            alignment: Alignment.center,
            child: yearX == ''
                ? Text(
                    ' النموذج رقم ' + titleBtn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Kufi'),
                  )
                : Text(
                    link,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Kufi'),
                  ),
          ),
        ),
      ),
    );
  }
}
