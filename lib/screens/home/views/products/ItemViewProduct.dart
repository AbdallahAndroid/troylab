import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:troylab/data/model/MProduct.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/resourceProject/FontProject.dart';
import 'package:troylab/resource/ui/toast/ToastTools.dart';
import 'package:troylab/screens/home/blockHomePage/category/CategoryBloc.dart';
import 'package:troylab/screens/home/views/products/BarKcalAndInfo.dart';
import 'package:troylab/screens/home/views/products/barAddToCart.dart';

double itemViewProduct_frame_width = 200;

class ItemViewProduct extends StatefulWidget {
  MProduct mProduct;
  CategoryBloc bloc;

  ItemViewProduct(this.mProduct, this.bloc);


  @override
  ItemViewProductState createState() => ItemViewProductState();
}

class ItemViewProductState extends State<ItemViewProduct> {
  @override
  Widget build(BuildContext context) {
    itemViewProduct_frame_width = DeviceTools.getHalfWidth(context);

    return Container( child: getContent(),
      margin: EdgeInsets.all( 5 ),
      decoration: BoarderHelper.cardView(
        radiusSize: 15,
        colorBackground: ColorProject.white
      ),
    );
  }

  Widget getContent(){
    return ColumnTemplate.t( children: [
      getBarKcalAndInfo(),
      SizedBox( height: 10,),
      imPhotoProduct(),
      SizedBox( height: 10,),
      tvTitle(),
      SizedBox( height: 10,),
      barStock(),
      SizedBox( height: 10,),
      getBarAddToCart(),
      SizedBox( height: 10,),
    ]);
  }

  //------------------------------------------------------------- image

  Widget imPhotoProduct(){
    double size = itemViewProduct_frame_width * 0.75;
    var image =  ImageFastor(context:  context,
        // colorBackground: Colors.grey,
        assetBackground: DrawableProject.images( widget.mProduct.image ),
        boxFit_background: BoxFit.contain,
        width: size,
        height: size);
    
    return Container( child:  image ,
      alignment: Alignment.center,
      padding: EdgeInsets.all( 10  ),
    );
  }


  Widget tvTitle(){
    return TextFastor( widget.mProduct.name ,
      color: Colors.black,
      fontSize: 14,
      width: itemViewProduct_frame_width,
      margin: EdgeInsets.symmetric(horizontal: 10),
      textAlign: TextAlign.center,
      // backgroundColor: Colors.grey,
    );
  }

  //--------------------------------------------------------------- barStock

  Widget barStock(){
    String msg = "";

    msg += widget.mProduct.stock.toString();
    msg += " : الكمبية بالمخزون";
    // msg += " قطعة ";

    var txt = TextFastor( msg, fontSize: 14, color: Colors.black,);


    return Container( child:  txt ,
    // width: itemViewProduct_frame_width,
    //   color: Colors.green,
      alignment: Alignment.center,
    );
  }

}