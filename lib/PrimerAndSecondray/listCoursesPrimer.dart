import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../Buttons/customButton.dart';
import '../Buttons/customButtonEmpty.dart';
import '../ad_helper/ad_helper.dart';

class ListCoursesPrimer extends StatefulWidget {
  final String years, level;
  String yearX = 'noChanged';
  ListCoursesPrimer(this.years, this.level);
  @override
  _ListCoursesPrimerState createState() => _ListCoursesPrimerState();
}

class _ListCoursesPrimerState extends State<ListCoursesPrimer> {
  // set ads
  @override
  void initState() {
    // TODO: implement initState
    AdHelper.disposeAd();
    AdHelper.myBanner.load();
    super.initState();
  }

  AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
  // and set ads
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
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
            bottomNavigationBar: Container(
              height: 50,
              color: Colors.black38,
              child: adWidget,
            ),
            body: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 105, //Use of SizedBox
                    ),
                    Container(
                      width: 40.0,
                    ),
                    Flexible(
                      child: Center(
                        child: Text(
                            'فروض، إختبارات،  ملخصات،  دروس و تمارين مع الحل و الكثير من الملفات المفيدة في جميع المواد ',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.orange,
                                fontFamily: 'Kufi')),
                      ),
                    ),
                    Container(
                      width: 40.0,
                    ),
                  ],
                ),
                SizedBox(
                  //Use of SizedBox
                  height: 0,
                ),
                value.getTheme() == ThemeData.light().copyWith()
                    ? Text(
                        'قائمة المواد',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Kufi'),
                      )
                    : Text(
                        'قائمة المواد',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'Kufi'),
                      ),
                SizedBox(
                  height: 35, //Use of SizedBox
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      CustomBTN('لغة عربية', Icons.auto_stories, widget.years,
                          widget.level, '', ''),
                      CustomBTN('رياضيات', Icons.calculate, widget.years,
                          widget.level, '', ''),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment //
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      widget.level == '2_Secondary'
                          ? CustomBTN('علوم الطبيعة', Icons.biotech_sharp,
                              widget.years, widget.level, '', '')
                          : CustomBTN('تربية علمية', Icons.biotech_sharp,
                              widget.years, widget.level, '', ''),
                      CustomBTN(' إسلامية', Icons.brightness_low_outlined,
                          widget.years, widget.level, '', ''),
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
                      CustomBTN('تربية مدنية', Icons.account_balance_outlined,
                          widget.years, widget.level, '', ''),
                      widget.level == '2_Secondary'
                          ? CustomBTN('إعلام آلي', Icons.computer, widget.years,
                              widget.level, '', '')
                          : widget.years == 'الثانية إبتدائي' ||
                                  widget.years == 'الثالثة إبتدائي'
                              ? CustomBTN('فرنسية', Icons.language,
                                  widget.years, widget.level, '', '')
                              : CustomButtonEmpty(
                                  ' ', Icons.announcement, widget.years),
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
                      if (widget.years == 'الرابعة إبتدائي' ||
                          widget.years == 'الخامسة إبتدائي' ||
                          widget.years == 'الثالثة إبتدائي' ||
                          widget.level == '2_Secondary')
                        CustomBTN('إجتماعيات', Icons.explore, widget.years,
                            widget.level, '', ''),
                      if (widget.years == 'الرابعة إبتدائي' ||
                          widget.years == 'الخامسة إبتدائي' ||
                          widget.level == '2_Secondary')
                        CustomBTN('فرنسية', Icons.language, widget.years,
                            widget.level, '', ''),
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
                      if (widget.level == '2_Secondary')
                        CustomBTN('إنجليزية', Icons.g_translate_sharp,
                            widget.years, widget.level, '', ''),
                      if (widget.level == '2_Secondary')
                        CustomBTN('فيزياء', Icons.science_outlined,
                            widget.years, widget.level, '', ''),
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
        );
        ;
      },
    );
  }
}
