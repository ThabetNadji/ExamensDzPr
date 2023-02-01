import 'package:flutter/material.dart';

import 'branch.dart';

class cardHomeWidgetDark extends StatefulWidget {
  String image, textDetail, textButton, year, level;

  cardHomeWidgetDark(
      this.image, this.textDetail, this.textButton, this.year, this.level);
  @override
  _cardHomeWidgetState createState() => _cardHomeWidgetState();
}

class _cardHomeWidgetState extends State<cardHomeWidgetDark> {
  String get_year() {
    return widget.year;
  }

  String get_level() {
    return widget.level;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28, //165, //235,
        width: MediaQuery.of(context).size.width * 0.9, //310
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            image: AssetImage(
              widget.image,
            ),
            //fit: BoxFit.none,
          ),
          color: Colors.black87,
          //color: Color.fromARGB(199, 0, 0, 0),
          border: Border.all(width: 2, color: Color.fromARGB(179, 37, 37, 37)),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                // color: Colors.white,
                // ignore: deprecated_member_use
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 7.0,
                      right: 7.0,
                    ),
                    child: Text(widget.textDetail,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontFamily: 'Kufi',
                            fontWeight: FontWeight.bold))),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 22, 133, 66),
                    onPrimary: const Color(0xFF63d471),
                  ),
                  onPressed: () {
                    branch br = new branch(get_year(), get_level());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => br));
                  },
                  child: Ink(
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 100.0, minHeight: 35.0), // button size
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height * 0.03,
                              ),
                            ),
                            TextSpan(
                                text: ' ' + widget.textButton,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
