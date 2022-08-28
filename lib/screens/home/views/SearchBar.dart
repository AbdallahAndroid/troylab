
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/screens/home/HomePage.dart';

double buttonSizeSearch = 40;
double searchBarHeight = 60;

extension SearchBar on HomeState {

  Widget searchBar(){
    var row =  Stack(

    children: [

      EmptyView.colored(
      DeviceTools.getWidth(context), searchBarHeight, Colors.transparent), //ColorProject.green_dark

      Positioned(child:  bt_accountSeller(), left: 20, top: 10,),

      Positioned(child:  bt_searchAllStudent(), left: 70, top: 10,),

     Positioned(child: textfieldBar(), right: 0, top: 10, )

    ]);

    return row;

  }

  Widget bt_accountSeller() {
    var image = ImageFastor(context: context,
        // colorBackground: ColorProject.orange,
        // radius_all: 5,
        assetAspectRatio: DrawableProject.images( "button_account"),
        onPressed: (){
          Log.i( "click on button_search");

        },
        width: buttonSizeSearch, height: buttonSizeSearch);

    return image;

  }

  Widget bt_searchAllStudent(){
    var image = ImageFastor(context: context,
        // colorBackground: ColorProject.orange,
        // radius_all: 5,
        assetAspectRatio: DrawableProject.images( "button_search"),
        onPressed: (){
          Log.i( "click on button_search");

        },
        width: buttonSizeSearch, height: buttonSizeSearch);

    return image;
  }


  Widget textfieldBar(){

    // icon searcht
    Widget iconSearch =  _getIconSearch();

    //tf
    var tf =  TextFieldTemplate.t(
        autovalidateMode: search_valid,
        width: 150,
       textAlign: TextAlign.end,
       // prefixIcon: iconSearch,
        fontSize: 12,
        hint_text: "اسم الطالب",
        hint_color: ColorProject.grey,
        text_color: ColorProject.black,
        background_color: Colors.transparent,
        validator: ValidatorTemplate.name( ),
        keyboardType: TextInputType.name,
        padding: EdgeInsets.all( 8 ),
        onChanged: (s){
          search_txt  = s;
          Log.i( "search_txt " + s );
        }
      // margin: EdgeInsets.only( top: DesignSystemDimen.ds_space_to_level_2)
    );


    //row
    var row = RowTemplate.scroll( context, [
      iconSearch ,
      SizedBox( width: 10,),
      tf
    ]);

    //boarder
    return Container( child:  row ,
      padding: EdgeInsets.only( right: 15 ),
      margin: EdgeInsets.only( right: 20 ),
      decoration: BoarderHelper.cardView( radiusSize:  15 ,
          colorLine: Colors.transparent
      ),
    );
  }

  Widget _getIconSearch(){
    var image = ImageFastor(context: context,
        assetAspectRatio: DrawableProject.images( "search"),
        width: 12,
        height: 12);
    return Container( child:  image,
      margin: EdgeInsets.symmetric( horizontal: 10),
    );
  }


}