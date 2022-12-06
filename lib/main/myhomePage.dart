import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../PrimerAndSecondray/listCoursesPrimer.dart';
import 'contactUs.dart';
import 'myHomePage2.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ScreenHiddenDrawer> _pages = [];

  TextStyle myTextStyle = TextStyle(
    fontFamily: 'Kufi',
  );

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: '',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          myHomePage2()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الصفحة الرئيسية',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          myHomePage2()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'أولى إبتدائي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('أولى إبتدائي'), ('1_Primer'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الثانية إبتدائي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('الثانية إبتدائي'), ('1_Primer'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الثالثة إبتدائي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('الثالثة إبتدائي'), ('1_Primer'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الرابعة إبتدائي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('الرابعة إبتدائي'), ('1_Primer'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الخامسة إبتدائي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('الخامسة إبتدائي'), ('1_Primer'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'تواصل معنا   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          contactUs())
    ];
  }

  @override
  Widget build(BuildContext context) {
    contactUs contactUS = new contactUs();
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return new MaterialApp(
          theme: value.getTheme(),
          home: HiddenDrawerMenu(
            backgroundColorContent: Colors.white,
            backgroundMenu: DecorationImage(
              scale: MediaQuery.of(context).size.width / 135,
              alignment: Alignment.topLeft,
              //isAntiAlias: false,
              //fit: BoxFit.contain,
              image: AssetImage("assets/images/myNewLogo5.png"),
            ),
            verticalScalePercent: 75.0,
            contentCornerRadius: 10.0,
            enableShadowItensMenu: true,
            withShadow: true,
            isTitleCentered: true,
            backgroundColorMenu: Color.fromARGB(0, 63, 60, 60),
            initPositionSelected: 1,
            slidePercent: MediaQuery.of(context).size.width / 5.5,
            screens: _pages,
          ));
    });
  }
}
