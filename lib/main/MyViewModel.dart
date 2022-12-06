import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'Myflushbar.dart';

class MyViewModel extends ChangeNotifier {
  var request;
  StreamedResponse response;
  var contentLength;
  List<int> bytes;
  List<int> bytes2;

  File fileX;
  File getfileX() => fileX; // get from file

  bool stateDownload;
  bool getDownloadState() => stateDownload;
  setDownloadState(bool x) => stateDownload = x;

  // ThemViewer
  bool themView = false;
  bool getThemeView() => themView;
  setThemView(bool b) {
    themView = b;
  }

  String _filePath;
  String getFilePath() => _filePath; // get from path

  List<int> fileList;
  List<int> getList() => fileList;

  double _pro = 0;
  double _progress = 0; // initiale value
  int getDownloadProgress() => _progress.toInt(); // get update
  int getPro() => _pro.toInt();
  setDownloadProgress(double x) => _progress = x;

  void cancelDownload() {
    print('downdoad was ended ...');
    //contentLength = 0;
    //bytes.clear();
    Client().close();
  }

  void startDownloading(String url) async {
    // update
    print('Starting Downloading  ----------------------->');

    request = Request('GET', Uri.parse(url));
    response = await Client().send(request);
    contentLength = response.contentLength;

    bytes = [];
    response.stream.listen(
      (List<int> newBytes) {
        bytes.addAll(newBytes);
        final downloadedLength = bytes.length;
        _progress = (downloadedLength / contentLength) * 100;
        notifyListeners();
      },
      onDone: () async {
        String filename = 'myDownload.pdf';
        final _externalDirectory = await getExternalStorageDirectory();
        var dir = Directory("${_externalDirectory.path}/$filename");
        final file = File(dir.path); // file with directory
        fileX = await file.writeAsBytes(bytes,
            flush: true); // write the pdf in the directory
        stateDownload = true;
        notifyListeners();
      },
      onError: (e) {
        print(e);
      },
      cancelOnError: true,
    );
  }

  savingFile(String newPath, String fileName, BuildContext context) async {
    final _externalDirectory = await getExternalStorageDirectory();
    var _dir = Directory("${_externalDirectory.path}/$newPath");
    if (_dir.existsSync()) {
      print('dir existe');
      getfileX().copy(_dir.path + '/' + fileName);
    } else {
      print('dir dont existe ...');
      var directory = await Directory(_externalDirectory.path + '/' + newPath)
          .create(recursive: true);
      getfileX().copy(directory.path + '/' + fileName);
      print('a new one is created successfully ...');
    }
    print('saving proccess end ...');
    Myflushbar myflushbar = new Myflushbar(
        'تم حفظ الملف', 'يمكنك الآن تصفح الملف بدون الحاجة للإتصال بالإنترنت');
    myflushbar.myWidget(context);
  }

  savingFileBEM(String newPath, String fileName) {
    Fluttertoast.showToast(
        msg:
            ' نعتذر، خاصية حفظ ملفات شهادة التعليم الإبتدائى غير متوفره الآن ،سيتم إضافتها في الإصدارات القادمة ',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        // timeInSecForIos: 4,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  deletFile() async {
    if (getDownloadProgress() == 100) {
      getfileX().delete();
      //print('file deleted ...');
    } else {
      //print('cant delete the file ...');
    }
  }
}
