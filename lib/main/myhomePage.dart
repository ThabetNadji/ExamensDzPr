import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../SideDrawer/sideDrawer.dart';
import '../ad_helper/ad_helper.dart';
import 'cardHomeWidget.dart';
import 'cardHomeWidgetDark.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int estimateTs = DateTime(2022, 06, 02, 00, 00, 00).millisecondsSinceEpoch;
  // set needed date

  // set ads
  @override
  void initState() {
    // TODO: implement initState
    //AdHelper.disposeAd();
    AdHelper.myBanner.load();
    super.initState();
  }

  AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
  // and set ads

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return new MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
            drawer: SideDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                ' التــعـليــم الإبــتدائـي - Examens DZ ',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  color: Colors.orange,
                  fontFamily: 'Kufi',
                ),
              ),
              actions: <Widget>[],
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
            bottomNavigationBar: Container(
              height: 50,
              color: Colors.black38,
              child: adWidget,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30, //Use of SizedBox
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width * 0.95, // 400
                          height:
                              MediaQuery.of(context).size.height * 0.5, //673
                          child: Column(
                            children: <Widget>[
                              Container(
                                //height: 30,
                                //width: 675,
                                decoration: BoxDecoration(
                                    //color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    StreamBuilder(
                                        stream: Stream.periodic(
                                            Duration(seconds: 1), (i) => i),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<int> snapshot) {
                                          DateFormat format =
                                              DateFormat("mm:ss");
                                          int now = DateTime.now()
                                              .millisecondsSinceEpoch;
                                          Duration remaining = Duration(
                                              milliseconds: estimateTs - now);
                                          var dateString =
                                              '${remaining.inHours}:${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
                                          var dayX = remaining.inHours / 24;
                                          var min = remaining.inHours * 60;
                                          var sec = min * 60;

                                          double day;
                                          if (dayX >= 0) {
                                            day = dayX;
                                          } else {
                                            day = 0;
                                            min = 0;
                                            sec = 0;
                                            dateString = '0';
                                          }
                                          //print(dateString);
                                          return Container(
                                            color: Colors.greenAccent
                                                .withOpacity(0.3),
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    //remaining

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center, //Center Row contents horizontally,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center, //Center Row contents vertically,
                                                      children: [],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center, //Center Row contents horizontally,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center, //Center Row contents vertically,
                                                      children: [
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                        ),
                                                        Text(
                                                            'من جد وجد و من سار على الدرب وصل',
                                                            style:
                                                                new TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10.0,
                                                              //color: Colors.orange,
                                                              fontFamily:
                                                                  'Kufi',
                                                            )),
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        'بالتـــوفـيق لكــل مجـتهــد ',
                                                        style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.0,
                                                          //color: Colors.orange,
                                                          fontFamily: 'Kufi',
                                                        )),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.020,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60, //Use of SizedBox
                              ),
                              value.getTheme() == ThemeData.light().copyWith()
                                  ? cardHomeWidget(
                                      'assets/images/educ_5_re.png',
                                      'مواضيع شهادة التعليم الإبادائى للسنوات الماضيه مع الحل ',
                                      '5 eme',
                                      'CinqEme',
                                      '')
                                  : cardHomeWidgetDark(
                                      'assets/images/educ_5_re.png',
                                      'مواضيع شهادة التعليم الإبتدائى للسنوات الماضيه مع الحل ',
                                      '5 eme',
                                      'CinqEme',
                                      ''),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
