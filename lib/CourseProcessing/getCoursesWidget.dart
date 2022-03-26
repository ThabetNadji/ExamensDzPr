import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/Buttons/courseContentButton.dart';
import 'package:myEduApp/Buttons/courseContentButtonMore.dart';
import 'package:myEduApp/PDFreader/Viewpdf.dart';
import 'package:firebase_core/firebase_core.dart';

class GetCoursesWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Viewpdf viewpdf;
  CourseContentButton cButton;
  CourseContentButtonMore cButtonMore;
  String subject, years, tri, level, speciality, yearX;
  GetCoursesWidget(this.subject, this.years, this.tri, this.level,
      this.speciality, this.yearX);

  // function_to_retrive_data_from_Firebse_Storage(Primer and Seconary level)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_Pr_Se() {
    var listUrl = FirebaseStorage.instance
        .ref(level + '/' + years + '/' + subject + '/' + tri)
        .listAll();
    return listUrl;
  }

  // function_to_retrive_data_from_Firebse_Storage(bem 5eme)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_Pr_Se_End() {
    var listUrl = FirebaseStorage.instance
        .ref(years + '/' + yearX + '/' + subject)
        .listAll();
    return listUrl;
  }

// Coeur2 de l'app
  Widget getCourses() {
    print(level);
    print(years);
    print(subject);
    print(tri);
    int i = 0;
    return FutureBuilder<ListResult>(
      future: getListCourses_Pr_Se(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              //CircularProgressIndicator(),
              CupertinoActivityIndicator(),
              SizedBox(
                height: 40,
              ),
              Text('... يتم العمل على جلب البيانات '),
            ],
          ));
        } else {
          return Column(
            // ignore: non_constant_identifier_names
            children: snapshot.data.items.map((Ref) {
              List<CourseContentButton> listUrlPDF = <CourseContentButton>[];
              List<CourseContentButtonMore> listUrlPDFMore =
                  <CourseContentButtonMore>[];
              var pdfURL = Ref.getDownloadURL();

              i++;
              if (tri == 'xmore') {
                listUrlPDFMore.add(cButtonMore = new CourseContentButtonMore(
                    viewpdf = new Viewpdf(pdfURL, Ref.fullPath, tri, level,
                        years, subject, 'Ref.fullPath'),
                    Ref.fullPath));
              } else {
                listUrlPDF.add(cButton = new CourseContentButton(
                    viewpdf = new Viewpdf(pdfURL, i.toString(), tri, level,
                        years, subject, Ref.fullPath),
                    i.toString(),
                    ''));
              }
              if (tri == 'xmore') {
                return (Column(children: listUrlPDFMore));
              } else {
                return (Column(children: listUrlPDF));
              }
            }).toList(),
          );
        }
      },
    );
  }

  // Coeur2 de l'app
  Widget getCoursesEnd() {
    return Container(
        child: new FutureBuilder<ListResult>(
      future: getListCourses_Pr_Se_End(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return new Column(
            children: [Text('الملفات غير متوفره الآن ...')],
          );
        } else {
          return Column(
            // ignore: non_constant_identifier_names
            children: snapshot.data.items.map((Ref) {
              List<CourseContentButton> listUrlPDF = <CourseContentButton>[];
              var pdfURL = Ref.getDownloadURL();
              String fullPath = Ref.fullPath;
              listUrlPDF.add(cButton = new CourseContentButton(
                  viewpdf = new Viewpdf(
                      pdfURL, '', '', level, years, subject, Ref.fullPath),
                  fullPath,
                  yearX));
              return (Column(children: listUrlPDF));
            }).toList(),
          );
        }
      },
    ));
  }
}

/*, level,years, subject, Ref.fullPath */
