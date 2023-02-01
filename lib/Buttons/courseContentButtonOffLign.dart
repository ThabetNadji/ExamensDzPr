import 'package:flutter/material.dart';
import 'package:myEduApp/PDFreader/PdfViewOffLign.dart';
import '../PDFreader/Viewpdf.dart';

// ignore: must_be_immutable
class courseContentButtonOffLign extends StatelessWidget {
  Viewpdf viewpdf;
  String path, fileName, tri;
  courseContentButtonOffLign(this.path, this.fileName, this.tri);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(75, 50), // button width and height
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PdfViewOffLign(
                      path: path, fileName: fileName, tri: tri)));
        },
        child: Column(
          children: <Widget>[
            Icon(
              Icons.arrow_forward,
              size: MediaQuery.of(context).size.width * 0.032,
              color: Colors.orange,
            ),
            Text(
              "تصفح",
              style: TextStyle(
                fontFamily: 'Kufi',
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: MediaQuery.of(context).size.height * 0.015,
              ),
            )
          ],
        ),
      ),
    );
  }
}
