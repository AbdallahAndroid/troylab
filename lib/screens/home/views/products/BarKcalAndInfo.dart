import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/resourceProject/FontProject.dart';
import 'package:troylab/resource/ui/toast/ToastTools.dart';
import 'package:troylab/screens/home/views/products/ItemViewProduct.dart';

extension BarKcalAndInfo on ItemViewProductState {


  //--------------------------------------------------------------- bar kcal

  Widget getBarKcalAndInfo() {
    double height = 50;

    return Stack( children: [

      EmptyView.empty(  itemViewProduct_frame_width, height),

      Positioned(child:  imInfo(), right:  0,),

      Positioned(child:  barKcal() )

    ],);
  }

  Widget barKcal(){
    var iconMan = ImageFastor(context: context, width: 17, height: 17,
      padding: EdgeInsets.all( 3 ),
      assetAspectRatio: DrawableProject.images( "man" ),
    );

    var valueTv = TextFastor(  widget.mProduct.kcal.toString() + " Kcal" ,
      fontSize: 10,
      margin: EdgeInsets.only( top: 3 ),
      fontFamily: FontProject.tajawal_medium,
    );

    var row = Row( children: [
      iconMan ,
      SizedBox( width:  5 ,),
      valueTv
    ],);

    return Container( child:  row,
      width: 80,
      margin: EdgeInsets.only(top: 10, left: 10),
      decoration: BoarderHelper.cardView(
          radiusSize: 8,
          colorBackground: ColorProject.green_light_water
      ),
    );
  }

  Widget imInfo(){
    var img =  ImageFastor(context: context,
        assetAspectRatio: DrawableProject.images( "info"),

        onPressed: (){
          ToolsToast.i(context, "Coming Soon Page Product information, product name: " + widget.mProduct.name );
        },
        width: 18, height: 18);

    return Container( child:  img,
      margin: EdgeInsets.only(top: 10, right: 10),
    );
  }
}