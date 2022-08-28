import 'package:easy_localization/easy_localization.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:troylab/resource/ui/scroll/MyScrollTheme.dart';
import 'package:troylab/splash_screen.dart';

import 'resource/fastor/ds/DesignSystemFastor.dart';
import 'resource/tools/constant/EnvironmentConstant.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';


void main () async {

    //ui wait
    await WidgetsFlutterBinding.ensureInitialized();

    //translation
    await EasyLocalization.ensureInitialized();
    await LanguageTools.instance();


    //firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    //fastor
    await DesignSystemFastor.ensureInitialized();

    //run
    var easyLocal =    EasyLocalization(
        supportedLocales:   LanguageTools.listLocal,
        path:  'assets/translations',// 'assets/translations',
        fallbackLocale:  LanguageTools.defaultLocal,
        child: MyApp()
    );
    runApp(easyLocal);

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return getMaterialApp(context);
  }

  /**
   * import 'package:firebase_analytics/firebase_analytics.dart';
   */
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = new FirebaseAnalyticsObserver(
      analytics: analytics);



  MaterialApp getMaterialApp(BuildContext context)   {
    return MaterialApp(

        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        title: EnvironmentConstant.appName,
        navigatorObservers: <NavigatorObserver>[observer],
        color: StatusBarConstant.colorBackground,
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyScrollTheme(),
        home: Directionality( // add this
          textDirection: LanguageTools.getTextDirection(context),
          child:  getScaffold(),
        )

    );
  }


  Scaffold getScaffold() {
    return Scaffold(
      body: nextPage(),
      // resizeToAvoidBottomInset: true , //fix keyboard when open
    );
  }


  Widget nextPage(){
    return SplashScreen();
  }


}