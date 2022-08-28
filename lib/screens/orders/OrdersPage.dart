import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/ui/navigation/v/NavigationFastor.dart';
import 'package:troylab/resource/ui/toolbar/HomeToolbar.dart';

class OrdersPage extends StatefulWidget {
  String pageTitle;

  OrdersPage( this.pageTitle);


  @override
  State<StatefulWidget> createState() => OrdersState();

}

class OrdersState extends State<OrdersPage > {

  @override
  Widget build(BuildContext context) {
    return PageFastor( this,
        title: widget.pageTitle,

        //toolbar
        toolbar: HomeToolbar(),
        toolbar_height: homeToolbar_height,

        //navigation
        navigationBottom: NavigationFastor( context, 1),
        navigationBottom_height: NavigationFastor.frame_height,

        //content
        content: getContent(),

        //color
        statusBarColorCustom: ColorProject.green_deep,
        homeButtonsBackgroundColor: ColorProject.black
    );
  }

  Widget getContent() {
    return TextFastor( widget.pageTitle);
  }


}