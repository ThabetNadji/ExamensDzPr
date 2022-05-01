import 'package:flutter/material.dart';
import 'package:myEduApp/EndEduc/listCourses5.dart';

class branch extends StatefulWidget {
  String year, level;
  listCourses5 five;

  branch(this.year, this.level);

  @override
  _brachState createState() => _brachState();
}

class _brachState extends State<branch> {
  @override
  Widget build(BuildContext context) {
    if (widget.year == 'CinqEme') {
      return widget.five = new listCourses5(widget.year, widget.level);
    }
    return null;
  }
}
