//
//
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/ui/navigation/v/NavigationFastor.dart';
import 'package:troylab/resource/ui/toolbar/HomeToolbar.dart';

class SalesPage extends StatefulWidget {


  @override
  SalesState createState() => SalesState();

}

class SalesState extends State<SalesPage > {

  @override
  Widget build(BuildContext context) {
    return PageFastor( this,
        title: "المبيعات",

        //toolbar
        toolbar: HomeToolbar(),
        toolbar_height: homeToolbar_height,

        //navigation
        navigationBottom: NavigationFastor( context, 2),
        navigationBottom_height: NavigationFastor.frame_height,

        //content
        content: getContent(),

        //color
        statusBarColorCustom: ColorProject.green_deep,
        homeButtonsBackgroundColor: ColorProject.black
    );
  }

  Widget getContent() {
    return TextFastor(  "المبيعات");
  }


}