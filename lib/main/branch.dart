import 'package:flutter/material.dart';
import 'package:myEduApp/EndEduc/listCourses5.dart';
import 'package:myEduApp/EndEduc/listCoursesBac.dart';
import 'package:myEduApp/EndEduc/listCoursesBem.dart';

class branch extends StatefulWidget {
  String year, level;
  listCourses5 five;
  listCoursesBem bem;
  listCoursesBac bac;

  branch(this.year, this.level);

  @override
  _brachState createState() => _brachState();
}

class _brachState extends State<branch> {
  @override
  Widget build(BuildContext context) {
    if (widget.year == 'CinqEme') {
      return widget.five = new listCourses5(widget.year, widget.level);
    } else {
      if (widget.year == 'bem') {
        return widget.bem = new listCoursesBem(widget.year, widget.level);
      } else {
        if (widget.year == 'Bac') {
          return widget.bac = new listCoursesBac(widget.year, widget.level);
        }
      }
    }
    return null;
  }
}
