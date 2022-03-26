import 'package:flutter/material.dart';
import 'package:myEduApp/main/NetworkCheck.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import 'getCourses.dart';
import 'package:myEduApp/PDFreader/PdfView.dart';
import 'package:myEduApp/main/MyViewModel.dart';

// ignore: must_be_immutable
class ShowCourses extends StatefulWidget {
  String years, courseName, level, sp;

  ShowCourses(this.courseName, this.years, this.level, this.sp);
  @override
  _ShowCoursesState createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<ShowCourses>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<GetCourses> getCoursesList;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  // ignore: unused_element
  void _showAlert(BuildContext context) {
    PdfView pdfView = new PdfView();
    var myViewModel = Provider.of<MyViewModel>(context, listen: false);
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          int selectedRadio;

          if (myViewModel.getThemeView() == false) {
            selectedRadio = 1; // the theme is light
          } else {
            selectedRadio = 2; // the theme is dark
          }

          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.generate(3, (int index) {
                    return ListTile(
                      title: index == 0
                          ? RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child:
                                        Icon(Icons.menu_book_sharp, size: 30),
                                  ),
                                  TextSpan(
                                      text: "   إعدادات قارئ الملفات  ",
                                      style: TextStyle(
                                        fontFamily: 'Kufi',
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            )
                          : index == 1
                              ? //const Text('Light/ مظهر مضيئ', nights_stay_sharp
                              RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: " الوضع المضيئ ",
                                          style: TextStyle(
                                            fontFamily: 'Kufi',
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      WidgetSpan(
                                        child: Icon(Icons.wb_sunny_outlined,
                                            size: 20),
                                      )
                                    ],
                                  ),
                                )
                              : index == 2
                                  ? //const Text( 'Dark/ مظهر مظلم', //nights_stay_rounded
                                  RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: " الوضع المظلم ",
                                              style: TextStyle(
                                                fontFamily: 'Kufi',
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          WidgetSpan(
                                            child: Icon(
                                                Icons.nights_stay_rounded,
                                                size: 20),
                                          )
                                        ],
                                      ),
                                    )
                                  : Text(''),
                      leading: index != 0
                          ? Radio<int>(
                              value: index,
                              groupValue: selectedRadio,
                              activeColor: Colors.green[600],
                              onChanged: (int value) {
                                setState(() {
                                  selectedRadio = value;
                                  if (index == 1) {
                                    myViewModel.setThemView(false);
                                  } else {
                                    myViewModel.setThemView(true);
                                  }
                                });
                              },
                            )
                          : Text(''),
                    );
                  }),
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    NetworkCheck networkChecker = new NetworkCheck();
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return new MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        _showAlert(context);
                      },
                      child: Icon(
                        Icons
                            .miscellaneous_services_sharp, //blur_on_outlined  import_contacts
                        size: 26.0,
                      ),
                    )),
              ],
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              title: Text(
                widget.courseName + ' ' + widget.years + ' ' + widget.sp,
                style: TextStyle(
                    fontFamily: 'Kufi',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              flexibleSpace: Container(
                decoration: value.getTheme() == ThemeData.light().copyWith()
                    ? BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF167F57),
                              const Color(0xFF167F77),
                              const Color(0xFF167F82),
                              const Color(0xFF167F99)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                            stops: [0, 0.2, 0.7, 0.8]),

                        borderRadius:
                            BorderRadius.circular(0), //border corner radius
                      )
                    : BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0x00000000),
                              const Color(0x00000000),
                              const Color(0x00000000),
                              const Color(0x00000000)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                            stops: [0, 0.2, 0.7, 0.8]),

                        borderRadius:
                            BorderRadius.circular(0), //border corner radius
                      ),
              ), // green
              bottom: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: Colors.orange,
                tabs: [
                  Tab(
                    child: Text(
                      "فصل 1",
                      style: TextStyle(fontFamily: 'Kufi'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "2 فصل",
                      style: TextStyle(fontFamily: 'Kufi'),
                    ),
                  ),
                  Tab(
                    child: Text("3 فصل", style: TextStyle(fontFamily: 'Kufi')),
                  ),
                  Tab(
                    child: Text("مرفقات", style: TextStyle(fontFamily: 'Kufi')),
                  )
                ],
                indicatorColor: Colors.orange,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
              ),
              bottomOpacity: 1,
            ),
            body: TabBarView(
              children: <Widget>[
                SingleChildScrollView(
                    child: Column(children: [
                  Center(
                      child: Column(
                    children: [
                      Text(''),
                      Text(
                        'قائمة الفروض و الإختبارات',
                        style: TextStyle(
                            fontFamily: 'Kufi', fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder(
                        future: networkChecker.isInternet(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.toString() == 'true') {
                              // its mean that is a good inernet connection
                              return Text(
                                'إذا قمت بحفظ ملفات في هذا القسم،فعليك أن تقوم بإيقاف إتصالك بالأنترنت لتظهر لك المواضيع المحملة',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            } else {
                              // no iternet connection
                              return Text(
                                '',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            }
                          } else {
                            // something went wrong
                            return Text(
                              '',
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                  color: Colors.orange),
                            );
                          }
                        },
                      ),
                      Text(''),
                      GetCourses(widget.courseName, widget.years, 'first_trim',
                          widget.level, widget.sp, ''),
                    ],
                  ))
                ])),
                SingleChildScrollView(
                    child: Column(children: [
                  Center(
                      child: Column(
                    children: [
                      Text(''),
                      Text(
                        'قائمة الفروض و الإختبارات',
                        style: TextStyle(
                            fontFamily: 'Kufi', fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder(
                        future: networkChecker.isInternet(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.toString() == 'true') {
                              // its mean that is a good inernet connection
                              return Text(
                                'إذا قمت بحفظ ملفات في هذا القسم،فعليك أن تقوم بإيقاف إتصالك بالأنترنت لتظهر لك المواضيع المحملة',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            } else {
                              // no iternet connection
                              return Text(
                                '',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            }
                          } else {
                            // something went wrong
                            return Text(
                              '',
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                  color: Colors.orange),
                            );
                          }
                        },
                      ),
                      Text(''),
                      GetCourses(widget.courseName, widget.years, 'second_trim',
                          widget.level, widget.sp, ''),
                    ],
                  ))
                ])),
                SingleChildScrollView(
                    child: Column(children: [
                  Center(
                      child: Column(
                    children: [
                      Text(''),
                      Text(
                        'قائمة الفروض و الإختبارات',
                        style: TextStyle(
                            fontFamily: 'Kufi', fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder(
                        future: networkChecker.isInternet(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.toString() == 'true') {
                              // its mean that is a good inernet connection
                              return Text(
                                'إذا قمت بحفظ ملفات في هذا القسم،فعليك أن تقوم بإيقاف إتصالك بالأنترنت لتظهر لك المواضيع المحملة',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            } else {
                              // no iternet connection
                              return Text(
                                '',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            }
                          } else {
                            // something went wrong
                            return Text(
                              '',
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                  color: Colors.orange),
                            );
                          }
                        },
                      ),
                      Text(''),
                      GetCourses(widget.courseName, widget.years, 'third_trim',
                          widget.level, widget.sp, ''),
                    ],
                  ))
                ])),
                SingleChildScrollView(
                    child: Column(children: [
                  Center(
                      child: Column(
                    children: [
                      Text(''),
                      Text(
                        ' مراجع و ملخصات و ملفات اضافية متنوعة  ',
                        style: TextStyle(
                            fontFamily: 'Kufi', fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder(
                        future: networkChecker.isInternet(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.toString() == 'true') {
                              // its mean that is a good inernet connection
                              return Text(
                                'إذا قمت بحفظ ملفات في هذا القسم،فعليك أن تقوم بإيقاف إتصالك بالأنترنت لتظهر لك المواضيع المحملة',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            } else {
                              // no iternet connection
                              return Text(
                                '',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.orange),
                              );
                            }
                          } else {
                            // something went wrong
                            return Text(
                              '',
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                  color: Colors.orange),
                            );
                          }
                        },
                      ),
                      Text(''),
                      GetCourses(widget.courseName, widget.years, 'xmore',
                          widget.level, widget.sp, ''),
                    ],
                  ))
                ]))
              ],
              controller: _tabController,
            ),
          ));
    });
  }
}
