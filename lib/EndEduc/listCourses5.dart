import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/main/devicesType.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../Buttons/customButton.dart';
import '../ad_helper/ad_helper.dart';

class listCourses5 extends StatefulWidget {
  final String years, level;
  String yearX = '';
  listCourses5(this.years, this.level);
  @override
  _ListCoursesPrimerState createState() => _ListCoursesPrimerState();
}

class _ListCoursesPrimerState extends State<listCourses5> {
  @override
  void initState() {
    //super.initState();
    //AdHelper.disposeAd();
    //AdHelper.myBanner.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
    devicesType _devicesType = new devicesType();
    String devType = _devicesType.getDeviceType();
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
        theme: value.getTheme(),
        home: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text(
              widget.years,
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
            ),
          ),
          /*bottomNavigationBar: Container(
            height: 50,
            color: Colors.black38,
            child: adWidget,
          ),*/
          body: Column(
            children: <Widget>[
              SizedBox(
                //Use of SizedBox
                height: 10,
              ),
              devType == 'isPhone'
                  ? Text(
                      'شهادة التعليم الإبتدائي',
                      style: new TextStyle(
                          fontFamily: 'Kufi',
                          fontSize: MediaQuery.of(context).size.width * 0.057,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      'شهادة التعليم الإبتدائي',
                      style: new TextStyle(
                          fontFamily: 'Kufi',
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
              SizedBox(
                height: 35, //Use of SizedBox
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    new DropdownButton<String>(
                      hint: Center(
                        child: devType == 'isPhone'
                            ? Text(
                                'إختر السنة التي تريد عرض مواضيعها',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.037, //15
                                    fontFamily: 'Kufi'),
                              )
                            : Text(
                                'إختر السنة التي تريد عرض مواضيعها',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.01, //15
                                    fontFamily: 'Kufi'),
                              ),
                      ),
                      onChanged: (String newVal) {
                        setState(() {
                          widget.yearX = newVal;
                        });
                      },
                      items: <String>[
                        '2021',
                        '2019',
                        '2018',
                        '2017',
                        '2016',
                        '2015',
                        '2014',
                        '2014 دورة إستدراكية',
                        '2013',
                        '2013 دورة إستدراكية',
                        '2012',
                        '2011',
                        '2011 دورة إستدراكية',
                        '2010',
                        '2009',
                        '2008',
                        '2007',
                        '2007 دورة إستدراكية',
                        '2006',
                        '2005',
                        '2005 دورة إستدراكية'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      //value: speciality,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5, //Use of SizedBox
              ),
              widget.yearX == ''
                  ? Text('')
                  : devType == 'isPhone'
                      ? Text(
                          widget.yearX + 'مواضيع شهادة التعليم الإبتدائي لسنة',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.037, //13
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold),
                        )
                      : Text(
                          widget.yearX + 'مواضيع شهادة التعليم الإبتدائي لسنة',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02, //13
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold),
                        ),
              SizedBox(
                height: 25, //Use of SizedBox
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    CustomBTN('لغة عربية', Icons.auto_stories, widget.years,
                        widget.level, '', widget.yearX),
                    CustomBTN('رياضيات', Icons.calculate, widget.years,
                        widget.level, '', widget.yearX),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    CustomBTN('فرنسية', Icons.auto_stories, widget.years,
                        widget.level, '', widget.yearX),
                  ],
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
