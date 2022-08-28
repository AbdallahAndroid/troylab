
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';

const double homeToolbar_height = 50;

class HomeToolbar extends StatelessWidget {

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Stack( children: [

      //set size frame of widget
      EmptyView.colored(
        DeviceTools.getWidth(context),
          homeToolbar_height,
        ColorProject.green_deep
      ),

      //content
      Positioned(child: imLogo(), left: 0, right: 0, top: 10, ) ,

      Positioned(child: imAlarm(), left: 10, top: 10, )

    ],);
  }


  //---------------------------------------------------------------------------- title

  Widget tv_title(){
    var txt =  Text( "title",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: DSDimen.text_level_1,
            color: DSColor.toolbar_title,
            decoration:  TextDecoration.none
        )
    );

    return Container( child:  txt ,
        // margin: EdgeInsets.only(top: 15)
    );

  }

  Widget imLogo() {
    var image =  ImageFastor( context: context!,
      // colorBackground: Colors.black,
        assetBackground: DrawableProject.images(  "logo_white"),
        width: 80,
        height : 30 );

    // return SizedBox( child:  image, width: 80, height: 30,);
    return Container( child:  image,
    alignment: Alignment.center,
    // //   margin: EdgeInsets.only( top: 20),
     width: DeviceTools.getWidth(context!),
      height: 30,
    );
  }


  Widget imAlarm() {
    return ImageFastor(context: context!,

        assetBackground: DrawableProject.images(  "alarm"),
        width: 22, height: 25 );
  }

}
