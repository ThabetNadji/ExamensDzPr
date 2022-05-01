import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myEduApp/Buttons/CustomAlertDialog.dart';
import 'package:myEduApp/Buttons/courseContentButtonOffLign.dart';
import 'package:myEduApp/main/Myflushbar.dart';
import 'package:myEduApp/main/NetworkCheck.dart';
import 'package:path_provider/path_provider.dart';

import 'getCoursesWidget.dart';

// ignore: must_be_immutable
class GetCourses extends StatefulWidget {
  String subject = 'sub',
      years = 'y',
      tri = 'tr',
      level = 'level',
      speciality = 'sp',
      yearX = 'x';
  @override
  GetCoursesState createState() => GetCoursesState();

  //constructer

  GetCourses(String subject_, String years_, tri_, String level_,
      String speciality_, String yearX_) {
    tri = tri_;
    level = level_; // info  phy  eng ....
    yearX = yearX_;

    // subject
    if (subject_ == 'لغة عربية') {
      subject = 'arab';
    } else {
      if (subject_ == 'رياضيات') {
        subject = 'math';
      } else {
        if (subject_ == 'تربية علمية') {
          subject = 'science';
        } else {
          if (subject_ == ' إسلامية') {
            subject = 'islam';
          } else {
            if (subject_ == 'تربية مدنية') {
              subject = 'madania';
            } else {
              if (subject_ == 'إجتماعيات') {
                subject = 'geo_hes';
              } else {
                if (subject_ == 'فرنسية') {
                  subject = 'fr';
                }
                if (subject_ == 'إنجليزية') {
                  subject = 'eng';
                } else {
                  if (subject_ == 'فيزياء') {
                    subject = 'phy';
                  } else {
                    if (subject_ == 'إعلام آلي') {
                      subject = 'info';
                    }
                    if (subject_ == 'علوم الطبيعة') {
                      subject = 'science';
                    } else {
                      if (subject_ == 'فلسفة') {
                        subject = 'phelo';
                      } else {
                        if (subject_ == 'ه ميكانيكية') {
                          subject = 'mecanique';
                        } else {
                          if (subject_ == 'ه طرائق') {
                            subject = 'gen_proc';
                          } else {
                            if (subject_ == 'ه كهربائية') {
                              subject = 'elec';
                            } else {
                              if (subject_ == 'ه مدنية') {
                                subject = 'gen_civil';
                              } else {
                                if (subject_ == 'تسيير مالي') {
                                  subject = 'fen';
                                } else {
                                  if (subject_ == 'قانون') {
                                    subject = 'loi';
                                  } else {
                                    if (subject_ == 'إ و المناجمنت') {
                                      subject = 'manag';
                                    } else {
                                      if (subject_ == 'لغة إيطالية') {
                                        subject = 'italia';
                                      } else {
                                        if (subject_ == 'لغة ألمانية') {
                                          subject = 'german';
                                        } else {
                                          if (subject_ == 'لغة إسبانية') {
                                            subject = 'spag';
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    // level
    if (years_ == 'أولى إبتدائي' ||
        years_ == 'أولى متوسط' ||
        years_ == 'أولى ثانوي') {
      years = '1';
    } else {}
    if (years_ == 'الثانية إبتدائي' ||
        years_ == 'الثانية متوسط' ||
        years_ == 'ثانية ثانوي') {
      years = '2';
    } else {
      if (years_ == 'الثالثة إبتدائي' ||
          years_ == 'الثالثة متوسط' ||
          years_ == 'الثالثة ثانوي') {
        years = '3';
      } else {
        if (years_ == 'الرابعة إبتدائي' || years_ == 'الرابعة متوسط') {
          years = '4';
        } else {
          if (years_ == 'الخامسة إبتدائي') {
            years = '5';
          } else {
            if (years_ == 'CinqEme') {
              years = 'CinqEme';
            } else {
              if (years_ == 'bem') {
                years = 'bem';
              } else {
                if (years_ == 'Bac') {
                  years = 'Bac';
                }
              }
            }
          }
        }
      }
    }
  }
}

class GetCoursesState extends State<GetCourses> {
  @override
  void initState() {
    networkCheck.isInternet().then((internetState) {
      if (internetState == 'false') {
        getFiles(); //call getFiles() function on initial state.
        super.initState();
      }
    });
  }

  NetworkCheck networkCheck = new NetworkCheck();
  var _files;
  bool test = true;
  List<FileSystemEntity> _filesPDF = [];
  String dirX;
  void getFiles() async {
    String newPath = widget.level +
        '/' +
        widget.years +
        '/' +
        widget.subject +
        '/' +
        widget.tri +
        '/';
    final _externalDirectory = await getExternalStorageDirectory();
    var _dir = Directory("${_externalDirectory.path}/$newPath");
    dirX = _dir.path;
    print('----------------------> path provider ....');
    print(_dir.path);
    if (_dir.existsSync()) {
      test = true;
      Directory dir = Directory(dirX);
      List<FileSystemEntity> _files;
      _files = dir.listSync(recursive: true, followLinks: false);
      for (FileSystemEntity entity in _files) {
        String path = entity.path;
        if (path.endsWith('.pdf')) _filesPDF.add(entity);
      }
    } else {
      print('no files to show ....');
      test = false;
    }
  }

  Myflushbar m = new Myflushbar('تم حذف الملف بنجاح', '>_');
  void deleteFile(int index, BuildContext context) {
    var dialog = CustomAlertDialog(
        title: "تأكيد العملية",
        message: "تريد فعلا حذف الملف ؟",
        onPostivePressed: () {
          _filesPDF[index].delete();
          m.myWidget(context);
        },
        positiveBtnText: 'نعم',
        negativeBtnText: 'لا');
    showDialog(context: context, builder: (BuildContext context) => dialog);
    //_filesPDF[index].delete();
  }

  @override
  Widget build(BuildContext context) {
    GetCoursesWidget getCoursesWidget = GetCoursesWidget(
        widget.subject,
        widget.years,
        widget.tri,
        widget.level,
        widget.speciality,
        widget.yearX);
    courseContentButtonOffLign btnOffLig;
    ScrollController sc = ScrollController();
    int i = 0;
    return FutureBuilder(
      future: networkCheck.isInternet(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.toString() == 'true') {
            if (widget.yearX != '') {
              return getCoursesWidget.getCoursesEnd(); // bac, bem, 5_eme
            } else {
              return getCoursesWidget.getCourses(); // normal courses
            }
          } else {
            return _filesPDF.isEmpty
                ? Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.wifi_off_sharp, size: 20),
                            ),
                            TextSpan(
                                text:
                                    " تحقق من إتصال جهازك بشبكة الأنترنت -\n لـم تقم بتحميل أي ملفات في هـذا القسـم -\n ",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                    fontFamily: 'Kufi')),
                          ],
                        ),
                      ),
                    ],
                  )
                : Scrollbar(
                    isAlwaysShown: true,
                    controller: sc,
                    child: ListView.builder(
                      controller: sc,
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      //if file/folder list is grabbed, then show here
                      itemCount: _filesPDF?.length ?? 0,
                      itemBuilder: (context, index) {
                        i = i + 1;
                        String s = _filesPDF[index].path.split('/').last;
                        String ss = s.substring(0, s.indexOf('.pdf'));
                        return Card(
                            child: ListTile(
                          title: widget.tri != 'xmore'
                              ? Text(' الـنـمـوذج رقـم ' + i.toString(), // ss
                                  style: TextStyle(
                                      fontFamily: 'Kufi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 14))
                              : Text(ss, // ss
                                  style: TextStyle(
                                      fontFamily: 'Kufi',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 14)),
                          leading: TextButton.icon(
                            label: Text('حذف',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 10)),
                            onPressed: () => deleteFile(index, context),
                            icon: Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.red,
                            ),
                          ),
                          trailing: btnOffLig = new courseContentButtonOffLign(
                              _filesPDF[index].path.toString(),
                              ' النموذج رقم ' + i.toString(),
                              widget.tri),
                        ));
                      },
                    ),
                  );
          }
        } else {
          //SizedBox( height: 100,),
          return Column(
            children: [
              SizedBox(
                height: 35,
              ),
              // that maean -> Loading until get good internal conection
              Text('Loading...',
                  style: TextStyle(color: Colors.orange, fontSize: 14))
            ],
          );
        } //plagiarism_outlined
      },
    );
  }
}
