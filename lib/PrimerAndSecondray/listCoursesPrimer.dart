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
    //AdHelper.disposeAd();
    //AdHelper.myBanner.load();
    super.initState();
  }

  //AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
  // and set ads
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Text(
            'قائمة المواد',
            style: new TextStyle(
                fontSize: 20.0, color: Colors.white, fontFamily: 'Kufi'),
          ),
          SizedBox(
            height: 35, //Use of SizedBox
          ),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
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
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
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
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                CustomBTN('تربية مدنية', Icons.account_balance_outlined,
                    widget.years, widget.level, '', ''),
                widget.level == '2_Secondary'
                    ? CustomBTN('إعلام آلي', Icons.computer, widget.years,
                        widget.level, '', '')
                    : widget.years == 'الثانية إبتدائي' ||
                            widget.years == 'الثالثة إبتدائي'
                        ? CustomBTN('فرنسية', Icons.language, widget.years,
                            widget.level, '', '')
                        : CustomButtonEmpty(
                            ' ', Icons.announcement, widget.years),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
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
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                if (widget.level == '2_Secondary')
                  CustomBTN('إنجليزية', Icons.g_translate_sharp, widget.years,
                      widget.level, '', ''),
                if (widget.level == '2_Secondary')
                  CustomBTN('فيزياء', Icons.science_outlined, widget.years,
                      widget.level, '', ''),
              ],
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
