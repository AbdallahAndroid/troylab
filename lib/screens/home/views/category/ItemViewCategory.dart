import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:troylab/data/model/MCategory.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/resourceProject/FontProject.dart';
import 'package:troylab/screens/home/blockHomePage/category/CategoryBloc.dart';

double itemCategoryHeight = 45;

class ItemViewCategory extends StatelessWidget {

  MCategory mCategory;
  int selectedCategory;
  CategoryBloc bloc;
  bool isSelectedNow = false;

  ItemViewCategory(this.mCategory, this.selectedCategory, this.bloc) {

    isSelectedNow = mCategory.id == selectedCategory;
  }

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return GestureDetector( child:  getDecoration(),
      onTap: (){
        clickOnItem();
      },
    );
  }


  Widget getDecoration(){
    //color
    Color  colorBackgroundChoose = Colors.white;
    if( isSelectedNow ) {
      colorBackgroundChoose = ColorProject.green_light;
    }

    //decoration
    var decoration =  Container( child:  getRowContent() ,
      // color:  colorBackgroundChoose,
      padding: EdgeInsets.all( 5 ),
      margin: EdgeInsets.only(right: 15),
      height: itemCategoryHeight,
      decoration: BoarderHelper.cardView( radiusSize:  15 ,
          colorLine: Colors.transparent,
          colorBackground: colorBackgroundChoose
      ),
    );

    return decoration;
  }

  Widget getRowContent() {
    return   Row( children: [
      tvTitle() ,
      SizedBox( width: 10,),
      imCategory(),
    ],);
  }

  void clickOnItem(){

    //check type all
    if( mCategory.id == 0 ) {
      bloc.add( CategoryInitialEvent() );
      return;
    }

    bloc.add(  CategorySpecialEvent( mCategory.id ));
  }

  Widget imCategory(){
    //check not have image
    if( ToolsValidation.isEmpty( mCategory.asset ) ) {
      return EmptyView.zero();
    }

    //return image
    var image  = ImageFastor(context: context!,
        assetAspectRatio: DrawableProject.images( mCategory.asset ),
        onPressed: () => clickOnItem(),
        width: 25,
        height: 25);

    return image;
  }

  Widget tvTitle() {

    Color  color = ColorProject.green_light;
    if( isSelectedNow ) {
      color = ColorProject.white;
    }

    return TextFastor( mCategory.name,
      fontSize: 15,
      fontFamily: FontProject.sst_Arabic_Medium,
      color: color,
    );
  }
}