import 'package:flutter/material.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../Buttons/customButton.dart';

class listCoursesBem extends StatefulWidget {
  final String years, level;
  String yearX = '';
  listCoursesBem(this.years, this.level);
  @override
  _ListCoursesPrimerState createState() => _ListCoursesPrimerState();
}

class _ListCoursesPrimerState extends State<listCoursesBem> {
  @override
  Widget build(BuildContext context) {
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
          body: Column(
            children: <Widget>[
              SizedBox(
                //Use of SizedBox
                height: 40,
              ),
              Text(
                'شهادة التعليم المتوسط',
                style: new TextStyle(
                    fontFamily: 'Kufi',
                    fontSize: 20.0,
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
                      hint: Text(
                        'إختر السنة التي تريد عرض مواضيعها',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            fontFamily: 'Kufi'),
                      ),
                      onChanged: (String newVal) {
                        setState(() {
                          widget.yearX = newVal;
                        });
                      },
                      items: <String>['2020', '2019'].map((String value) {
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
                height: 25, //Use of SizedBox
              ),
              widget.yearX == ''
                  ? Text('')
                  : Text(
                      widget.yearX + 'مواضيع شهادة التعليم المتوسط لسنة',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
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
                  mainAxisAlignment: MainAxisAlignment //
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    CustomBTN('علوم الطبيعة', Icons.biotech_sharp, widget.years,
                        widget.level, '', widget.yearX),
                    CustomBTN(' إسلامية', Icons.brightness_low_outlined,
                        widget.years, widget.level, '', widget.yearX),
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
                        widget.years, widget.level, '', widget.yearX),
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
                    CustomBTN('إجتماعيات', Icons.explore, widget.years,
                        widget.level, '', widget.yearX),
                    CustomBTN('فرنسية', Icons.language, widget.years,
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
                    CustomBTN('إنجليزية', Icons.g_translate_sharp, widget.years,
                        widget.level, '', widget.yearX),
                    CustomBTN('فيزياء', Icons.science_outlined, widget.years,
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
