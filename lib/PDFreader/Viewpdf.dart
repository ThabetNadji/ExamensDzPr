import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:myEduApp/main/MyViewModel.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
//import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'PdfView.dart';

// ignore: must_be_immutable
class Viewpdf extends StatefulWidget {
  Future<String> futureUrl;
  String num_sub, tri, level, years, subject, fileName;
  //String pdfURL;
  Viewpdf(this.futureUrl, this.num_sub, this.tri, this.level, this.years,
      this.subject, this.fileName);
//, this.level, this.years,
  //this.subject, this.fileName
  setpdfURL(Future<String> url) {
    this.futureUrl = url;
  }

  @override
  _ViewpdfState createState() => _ViewpdfState();
}

class _ViewpdfState extends State<Viewpdf> {
  //PDFDocument document; //

  @override
  void initState() {
    var myViewModel = Provider.of<MyViewModel>(context, listen: false);

    widget.futureUrl.then((url) async {
      myViewModel.startDownloading(url);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String fullPathFile;
    String link;
    String link2;
    print(
        '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
    if (widget.tri == 'xmore') {
      try {
        link = widget.num_sub.split("/")[4];
        link2 = link;
        widget.num_sub = link.substring(0, link.indexOf('.pdf'));
        fullPathFile = widget.level +
            '/' +
            widget.years +
            '/' +
            widget.subject +
            '/' +
            widget.tri;
      } catch (e) {
        print('something went wrong ....');
        print(e);
      }
    } else {
      try {
        link2 = widget.fileName.split("/")[4];
        fullPathFile = widget.level +
            '/' +
            widget.years +
            '/' +
            widget.subject +
            '/' +
            widget.tri;
      } catch (e) {
        print('something went wrong ....');
        print(e);
      }
    }
    print('________________ tri =');
    print(widget.tri);
    var myViewModel = Provider.of<MyViewModel>(context, listen: false);
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: widget.tri != 'xmore'
                  ? Text(' النموذج رقم ' + widget.num_sub,
                      style: TextStyle(
                          fontFamily: 'Kufi',
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                  : Text(widget.num_sub,
                      style: TextStyle(
                          fontFamily: 'Kufi',
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                widget.tri != ""
                    ? RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        label: Text(
                          'حفظ الملف',
                          style: TextStyle(
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        icon: Icon(
                          Icons.download_sharp,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.orange[300],
                        color: Colors.orange,
                        onPressed: () {
                          myViewModel.savingFile(fullPathFile, link2, context);
                        },
                      )
                    : RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        label: Text(
                          'حفظ الملف',
                          style: TextStyle(
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        icon: Icon(
                          Icons.download_sharp,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.orange[300],
                        color: Colors.orange,
                        onPressed: () {
                          myViewModel.savingFileBEM(fullPathFile, link2);
                        },
                      ),
                Container(
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
                              stops: [0, 0.2, 0.7, 0.8]),

                          borderRadius:
                              BorderRadius.circular(0), //border corner radius
                        ),
                )
              ],
            ),
            body: new Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 600,
                    height: 670,
                    child: Consumer<MyViewModel>(
                      builder: (context, myViewModel, child) {
                        if (myViewModel.getDownloadProgress() < 100) {
                          return Center(
                              child: Column(
                            children: [
                              SizedBox(width: 60, height: 170),
                              Column(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 220.0,
                                    lineWidth: 10.0,
                                    percent: (myViewModel
                                            .getDownloadProgress()
                                            .toDouble()) /
                                        100,
                                    center: new Text(
                                        ' % ' +
                                            myViewModel
                                                .getDownloadProgress()
                                                .toString() +
                                            '  ',
                                        style: TextStyle(
                                            fontFamily: 'Kufi',
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: value.getTheme() ==
                                                    ThemeData.light().copyWith()
                                                ? Colors.black
                                                : Colors.white)),
                                    progressColor: Colors.green[800],
                                  )
                                ],
                              )
                            ],
                          ));
                        } else {
                          if (myViewModel.getDownloadProgress() == 100 &&
                              myViewModel.getDownloadState() == true) {
                            myViewModel.setDownloadState(false);
                            return Center(
                                child: PdfView(
                              path:
                                  '/storage/emulated/0/Android/data/com.Premaire.ExamensDZ/files/myDownload.pdf',
                            ));
                          } else {
                            return Center(child: Text('Loading files ...'));
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}

/* Center(child: PDFViewer(document: document)) */
