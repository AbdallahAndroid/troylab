//
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/ui/navigation/v/NavigationFastor.dart';
import 'package:troylab/resource/ui/toolbar/HomeToolbar.dart';

class WalletPage extends StatefulWidget {


  @override
  WalletOrdersState createState() => WalletOrdersState();

}

class WalletOrdersState extends State<WalletPage > {

  @override
  Widget build(BuildContext context) {
    return PageFastor( this,
        title: "المحفظة",

        //toolbar
        toolbar: HomeToolbar(),
        toolbar_height: homeToolbar_height,

        //navigation
        navigationBottom: NavigationFastor( context, 3),
        navigationBottom_height: NavigationFastor.frame_height,

        //content
        content: getContent(),

        //color
        statusBarColorCustom: ColorProject.green_deep,
        homeButtonsBackgroundColor: ColorProject.black
    );
  }

  Widget getContent() {
    return TextFastor(  "المحفظة");
  }


}