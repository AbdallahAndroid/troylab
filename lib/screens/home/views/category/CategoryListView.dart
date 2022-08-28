import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:troylab/data/mock/MockCategory.dart';
import 'package:troylab/data/mock/MockProduct.dart';
import 'package:troylab/data/model/MCategory.dart';
import 'package:troylab/data/model/MProduct.dart';
import 'package:troylab/screens/home/HomePage.dart';
import 'package:troylab/screens/home/blockHomePage/category/CategoryBloc.dart';
import 'package:troylab/screens/home/views/category/ItemViewCategory.dart';



class CategoryListView extends StatefulWidget {
  CategoryBloc bloc;
  CategoryListView(this. bloc);


  @override
  CategoryListState createState() => CategoryListState();

}
class CategoryListState extends State<CategoryListView> {


  @override
  Widget build(BuildContext context) {
    return ListViewTemplate.t(context: context, children: getChildren(), axis: Axis.horizontal);
  }

  List<Widget> getChildren(){
    List<Widget> listWidget = [];
    List<MCategory> listCategory = MockCategory.getListAll();
  //  Log.i( "CategoryListView - getChildren() - listCategory: " + listCategory.length.toString() );

    int selectedCategory = widget.bloc.state.categoryIdSelected;
    for( int i = 0 ; i < listCategory.length; i++ ) {
      MCategory mCategory = listCategory[i];
      Widget w = ItemViewCategory( mCategory, selectedCategory, widget.bloc);
      listWidget.add( w );
    }

    List<Widget> reversedList = new List.from(listWidget.reversed);

    return reversedList;
  }
}
/**

    Widget categoryList(){

    for
    }

 */