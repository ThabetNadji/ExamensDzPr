import 'package:flutter/material.dart';
import 'package:myEduApp/PDFreader/PdfView.dart';
import 'package:myEduApp/PDFreader/PdfViewOffLign.dart';
import '../PDFreader/Viewpdf.dart';

// ignore: must_be_immutable
class courseContentButtonOffLign extends StatelessWidget {
  Viewpdf viewpdf;
  String path, fileName, tri;
  courseContentButtonOffLign(this.path, this.fileName, this.tri);

  @override
  Widget build(BuildContext context) {
    String link;

    return SizedBox.fromSize(
      size: Size(75, 50), // button width and height
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PdfViewOffLign(
                      path: path, fileName: fileName, tri: tri)));
        },
        color: Colors.orange,
        padding: EdgeInsets.all(1.0),
        child: Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[Icon(Icons.arrow_forward), Text("تصفح")],
        ),
      ),
    );
  }
}

/*
return btnOffLign = new courseContentButtonOffLign(
                          dirX + '/' + files[index].path.split('/').last,
                          files[index].path.split('/').last,
                          widget.tri,
                          files[index].path.split('/').last)
 */
/*
FlatButton(
                onPressed: () => {},
                color: Colors.orange,
                padding: EdgeInsets.all(10.0),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.add),
                    Text("Add")
                  ],
                ),
              ),
 */

/*onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PdfView(path: path)));
      }, */
