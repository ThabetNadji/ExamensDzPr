import 'package:flutter/material.dart';
import 'package:myEduApp/highSchool/showCoursesHighSchoole.dart';
import './entry.dart';
import '../PrimerAndSecondray/listCoursesPrimer.dart';

class InitData {
  List<Entry> data;

  List getData(BuildContext context) {
    return data = <Entry>[
      Entry(
        // 'التعليم الإبتدائي',
        '                  التعليم الإبتدائي               ',
        <Widget>[
          ListTile(
            title: Text(' -  أولى إبتدائي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'Kufi',
                  fontSize: 18,
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ListCoursesPrimer(('أولى إبتدائي'), ('1_Primer'))));
            },
          ),
          ListTile(
            title: Text(' -  الثانية إبتدائي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListCoursesPrimer(
                          ('الثانية إبتدائي'), ('1_Primer'))));
            },
          ),
          ListTile(
            title: Text(' -  الثالثة إبتدائي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListCoursesPrimer(
                          ('الثالثة إبتدائي'), ('1_Primer'))));
            },
          ),
          ListTile(
            title: Text(' -  الرابعة إبتدائي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListCoursesPrimer(
                          ('الرابعة إبتدائي'), ('1_Primer'))));
            },
          ),
          ListTile(
            title: Text(' -  الخامسة إبتدائي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListCoursesPrimer(
                          ('الخامسة إبتدائي'), ('1_Primer'))));
            },
          )
        ],
      ),
    ];
  }

  //final List<Entry> data =
}
