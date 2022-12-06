import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper/AppOpenAdManager.dart';
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
    var isDarkTheme = prefs.getBool("darkTheme") ?? true;
    return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(isDarkTheme),
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

class _MyEduAppState extends State<MyEduApp> with WidgetsBindingObserver {
  //  <------- begin

  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    appOpenAdManager.loadAd();
    appOpenAdManager.showAdIfAvailable();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed && isPaused) {
      print("Resumed==========================");
      appOpenAdManager.showAdIfAvailable();
      isPaused = false;
    }
  } //  <------- end app open ads

  @override
  Widget build(BuildContext context) {
    Widget mainWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return new MaterialApp(
              theme: value.getTheme(),
              home: CustomSplash(
                imagePath: "assets/images/myNewLogo5.png",
                backGroundColor: Color(0xFF323232),
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
