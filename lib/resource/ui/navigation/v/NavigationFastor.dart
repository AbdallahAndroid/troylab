import 'package:flutter/material.dart';


import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';


import 'package:troylab/resource/tools/navigate/NavigationTools.dart';
import 'package:troylab/resource/ui/navigation/m/DataNavigationFastor.dart';
import 'package:troylab/resource/ui/navigation/m/ItemNavigationFastor.dart';
import 'package:troylab/resource/ui/navigation/m/MapItemToView.dart';

class NavigationFastor extends StatefulWidget {

  //size
  static double frame_height = 70;
  double sizeTab = 0; //will be calculated automatically
  double sizeIcon = 15;

  //info
  BuildContext contextPage;
  int currentPosition = 1 ;


  NavigationFastor( this.contextPage,   this.currentPosition );

  @override
  NavigationFastorState createState() {
    return NavigationFastorState();
  }


}

class NavigationFastorState extends State<NavigationFastor> {

  //-------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    calculateSize();

    return getCardView();
  }

  void calculateSize(){
    int sizeTabs = DataNavigationFastor.listItemNavigation.length;
    widget.sizeTab = DeviceTools.getWidth(context ) / sizeTabs;
  }

  Widget getCardView() {
    return rowTabs();
  }

  Widget rowTabs() {

    List<Widget> list = getListWidgetNavigationTab();

    var row =  RowTemplate.scroll( context,  list );

    //background
    return Container( child: row,
    color: DataNavigationFastor.colorBackgroundNavigation,
    );
  }

  //-------------------------------------------------------------------- generic tools ui


  Color getColor_text(int position ) {
    //case selected
    if( position == widget.currentPosition ) {
      // return HexColor( ColorProject.blue_fish_back);
      return DataNavigationFastor.colorSelected_text;
    }

    //case not selected
    // return HexColor( ColorProject.greyDark);
    return DataNavigationFastor.colorUnSelected_text;
  }


  Color getColor_line(int position ) {
    //case selected
    if( position == widget.currentPosition ) {
      // return HexColor( ColorProject.blue_fish_back);
      return DataNavigationFastor.colorSelected_line;
    }

    //case not selected
    // return HexColor( ColorProject.greyDark);
    return DataNavigationFastor.colorUnSelected_line;
  }


  Widget separator(int position){
    return Container( width: widget.sizeTab,
      height: 4,
      color: getColor_line(position ),
    );
  }

  void clickOnPosition(int positionNew , ItemNavigationFastor itemNav ){
    Log.i( "clickOnPosition() - positionNew: " + positionNew.toString() );

    //click on same position
    if( positionNew == widget.currentPosition ) return;

    //navigate
    NavigationTools.pushAndRemoveUntil( widget.contextPage, itemNav.goToPage );

  }


}


