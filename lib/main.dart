import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'main/MyViewModel.dart';
import 'main/myhomePage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:splashscreen/splashscreen.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'main/theme.dart';

Future<void> main() async {
  // google ads
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    // var isDarkTheme = prefs.getBool("darkTheme") ?? true;
    return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(true),
        ),
        ChangeNotifierProvider<MyViewModel>(
          create: (BuildContext context) => MyViewModel(),
        ),
      ],
      child: MyEduApp(),
    ));
  });
}

class MyEduApp extends StatefulWidget {
  @override
  _MyEduAppState createState() => _MyEduAppState();
}

class _MyEduAppState extends State<MyEduApp> {
  // app openAds ...
  @override
  Widget build(BuildContext context) {
    Widget mainWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return new MaterialApp(
              theme: value.darkTheme,
              home: CustomSplash(
                imagePath: "assets/images/myNewLogo5.png",
                backGroundColor: Color.fromARGB(255, 0, 0, 0),
                animationEffect: 'zoom-in',
                home: MyHomePage(),
                duration: 2500,
                type: CustomSplashType.StaticDuration,
              ),
            );
          },
        ));
    return mainWidget;
  }
}
