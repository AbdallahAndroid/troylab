import 'dart:async';
import 'dart:io';

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need_resume/need_resume.dart';


import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/FontProject.dart';
import 'package:troylab/resource/tools/constant/EnvironmentConstant.dart';
import 'package:troylab/resource/tools/time/WaitTools.dart';
import 'package:troylab/resource/ui/toast/ToastTools.dart';
import 'package:troylab/screens/home/HomePage.dart';

import 'resource/resourceProject/DrawableProject.dart';
import 'resource/tools/navigate/NavigationTools.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ResumableState<SplashScreen> {


  //--------------------------------------------------------------------- next page

  Future waitForSplashScreen() async {

    var time =  2000 ; //2000 not working in browser safari before code of socket
    Timer(Duration(milliseconds: time), () {

      nextPage();

    });

  }

  //------------------------------------------------------------------------ life cycle

  @override
  void initState()    {
    super.initState();
  //  Log.i( "SplashScreenState - initState()");

   waitForSplashScreen();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    onResume();
  }


  @override
  void onResume() {
    // TODO: implement onResume
    super.onResume();
  //  Log.i( "onResume() ");

  }

  //-----------------------------------------------------------------------build ui

  @override
  Widget build(BuildContext context) {

    return getScaffold();
  }


  Widget getScaffold() {
    return PageFastor(  this,
        title: "Splash",
        content: contentPage(),
        colorBackground: ColorProject.green_start,
        statusBarColorCustom: ColorProject.green_deep,
        homeButtonsBackgroundColor: ColorProject.green_deep
    );
  }

  Widget contentPage(){
    return Stack( children: [
      EmptyView.allDeviceScreen( context ),

      Positioned(child: getImageLogo() , left: 0, right: 0, top: 100 ), //top: 100*1.5,

      Positioned(child: websiteName() , bottom: 20, left: 0, right: 0 ),

       //test socket
     // testSocketNotification()
  ]);

  }

  Widget getImageLogo() {
    return   ImageView(
        width: 80*2, height: 30*2,
        assetAspectRatio:  DrawableProject.images( "logo_white")  );
  }


  Widget websiteName() {


    var text = Text(  "Abdallah Mahmoud \ntroylab.org",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
           fontFamily:  FontProject.sst_Arabic_Medium,
            color: ColorProject.white,
            decoration: TextDecoration.none,                               // underline shape
            decorationColor: ColorProject.green_deep, //underline color
        )
    );
    return Container(
      padding: const EdgeInsets.only( bottom: 20),
      alignment: Alignment.center,
      child: text,
    );
  }

  //-------------------------------------------------------------------- next page

  void nextPage() {

    //home page
    NavigationTools.pushAndRemoveUntil(context,  HomePage());
  }






}
