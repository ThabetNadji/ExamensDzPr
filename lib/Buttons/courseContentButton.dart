import 'package:flutter/material.dart';
import '../PDFreader/Viewpdf.dart';

// ignore: must_be_immutable
class CourseContentButton extends StatelessWidget {
  Viewpdf viewpdf;
  String titleBtn, yearX, fullPath, years;
  CourseContentButton(
      this.viewpdf, this.titleBtn, this.yearX, this.fullPath, this.years);

  @override
  Widget build(BuildContext context) {
    String b;
    String c;
    String d;
    String e;
    String f;
    bool withCorrection = false;
    String annee;
    String link;
    try {
      print('------------____________---------years');
      print(years);
      if (yearX != '') {
        link = titleBtn.split("/")[3]; // and 5 and 6
        link = link.substring(0, link.indexOf('.pdf'));
      } else {
        if (yearX == '' && fullPath != '' && years == '5') {
          f = fullPath.split("/")[4];

          if (f[0] == 'C') {
            withCorrection = true;
          }
          //String a = f[1];
          String b = f[2];
          String c = f[3];
          String d = f[4];
          String e = f[5];
          annee = b + c + d + e;
        }
      }
      //link = titleBtn.split("/")[5]; // and 5 and 6

    } catch (e) {
      print(e);
    }
    return Column(
      children: [
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
              // height: MediaQuery.of(context).size.height * 0.08,
              //constraints: BoxConstraints(maxWidth: 170.0, minHeight: 60.0),
              alignment: Alignment.center,
              child: (yearX == '' && fullPath != '' && years == '5')
                  ? Column(
                      children: [
                        Text(
                          ' النموذج رقم ' + titleBtn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Kufi'),
                        ),
                        Text(
                          ' السنة الدراسية ' + annee,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Kufi'),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: ' التصحيح ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      fontFamily: 'Kufi')),
                              withCorrection == true
                                  ? WidgetSpan(
                                      child: Icon(Icons.check, size: 20),
                                    )
                                  : WidgetSpan(
                                      child: Icon(
                                        Icons.cancel_rounded,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                    ),
                              TextSpan(
                                  text: ' ا ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 22, 133, 66),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                      fontFamily: 'Kufi'))
                            ],
                          ),
                        )
                      ],
                    )
                  : (yearX == '' &&
                          fullPath != '' &&
                          (years == '1' ||
                              years == '2' ||
                              years == '3' ||
                              years == '4'))
                      ? Text(
                          ' النموذج رقم ' + titleBtn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Kufi'),
                        )
                      : Text(
                          // more
                          link,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Kufi'),
                        ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
