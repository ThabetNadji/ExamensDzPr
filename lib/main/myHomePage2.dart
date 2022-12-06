import 'package:flutter/material.dart';
import 'cardHomeWidgetDark.dart';
import 'package:intl/intl.dart';
import 'contactUs.dart';

class myHomePage2 extends StatefulWidget {
  const myHomePage2({Key key}) : super(key: key);

  @override
  State<myHomePage2> createState() => _myHomePage2State();
}

class _myHomePage2State extends State<myHomePage2> {
  contactUs contactUS = new contactUs();
  int estimateTs = DateTime(2022, 06, 02, 00, 00, 00).millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: MediaQuery.of(context).size.width * 0.95, // 400
                    height: MediaQuery.of(context).size.height * 0.5, //673
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
                                    DateFormat format = DateFormat("mm:ss");
                                    int now =
                                        DateTime.now().millisecondsSinceEpoch;
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
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              //remaining

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center, //Center Row contents horizontally,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center, //Center Row contents vertically,
                                                children: [],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center, //Center Row contents horizontally,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center, //Center Row contents vertically,
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.035,
                                                  ),
                                                  Text(
                                                      'من جد وجد و من سار على الدرب وصل',
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
                                                            0.035,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                  'بالتـــوفـيق لكــل مجـتهــد ',
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                    //color: Colors.orange,
                                                    fontFamily: 'Kufi',
                                                  )),
                                              SizedBox(
                                                height: MediaQuery.of(context)
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
                        cardHomeWidgetDark(
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
    );
  }
}
