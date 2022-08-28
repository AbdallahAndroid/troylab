import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:troylab/data/model/MProduct.dart';
import 'package:troylab/screens/home/blockHomePage/category/CategoryBloc.dart';

import 'ItemViewProduct.dart';


class ProductListView extends StatefulWidget {

  CategoryBloc bloc;
  CategoryStateBase  categoryStateBase;

  ProductListView(this.bloc, this.categoryStateBase);

  @override
  ProductListState createState() => ProductListState();

}

class ProductListState extends State<ProductListView > {

  @override
  Widget build(BuildContext context) {

    //case state: error
    if( widget.categoryStateBase is CategoryErrorState ) {
      CategoryErrorState errorState = widget.categoryStateBase as CategoryErrorState;
      return TextFastor( errorState.msgError);
    }

    //case state : have data
    return shapeHaveData();
  }

  Widget shapeHaveData(){

    return GridViewFastor(span: 2, children: getChildren(), axis: Axis.vertical,);
    // return ListViewTemplate.t(context: context,
    //     children: getChildren(),
    //     axis: Axis.vertical);
  }

  List<Widget> getChildren(){
    List<Widget> listWidget = [];
    List<MProduct> listProduct = widget.bloc.state.listProduct;
    for( int i = 0 ; i < listProduct.length; i++ ) {
      MProduct mProduct = listProduct[ i ];
      Widget w = ItemViewProduct( mProduct, widget.bloc);
      listWidget.add( w );
    }

    return listWidget;
  }



}