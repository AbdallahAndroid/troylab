import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/ui/navigation/v/NavigationFastor.dart';
import 'package:troylab/resource/ui/toolbar/HomeToolbar.dart';
import 'package:troylab/screens/home/blockHomePage/category/CategoryBloc.dart';

import 'package:troylab/screens/home/views/category/CategoryListView.dart';
import 'package:troylab/screens/home/views/SearchBar.dart';

import 'views/products/ProductListView.dart';

class HomePage extends StatefulWidget {


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {

  //------------------------------------------------------------------ variable

  var search_txt = "";
  var search_valid = AutovalidateMode.disabled;

  CategoryBloc bloc = CategoryBloc();
  CategoryStateBase? categoryStateBase;
  //------------------------------------------------------------------ build

  @override
  Widget build(BuildContext context) {
    Log.i( "HomePage - build()  "  );

    return PageFastor( this,
        title: "Home Page",

        //toolbar
        toolbar: HomeToolbar(),
        toolbar_height: homeToolbar_height,

        // //background
        // assetBackground: DrawableProject.images( "example_2"),
        // assetBackgroundOpacity: 0.4,

        //navigation
        navigationBottom: NavigationFastor( context, 4),
        navigationBottom_height: NavigationFastor.frame_height,

        //content
        content: getBlocProviders(),

        //color
        statusBarColorCustom: ColorProject.green_deep,
        homeButtonsBackgroundColor: ColorProject.black
    );
  }


  Widget getBlocProviders(){
    return MultiBlocProvider(

      providers: [
        BlocProvider.value(value: bloc )
      ],

      child:  BlocBuilder<CategoryBloc, CategoryStateBase>(
        bloc:  bloc,
        builder: (context, state ){
          categoryStateBase = state;
          Log.i( "HomePage - categoryStateBase - " + categoryStateBase.toString() );

          return getContent();
        },
      ),
    );
  }

  Widget getContent(){

    //background
    return Stack( children: [
      EmptyView.allDeviceScreen(context),

     backgroundLinearColorLevel(),
      getColumnContent(),

    ],);
  }


  Widget getColumnContent(){
    var column =  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        searchBar(),

       //student
        /**
            // studentBar(),
            //  SizedBox( height: 150,) , //here to draw
         */

        //list
        CategoryListView( bloc),
        SizedBox( height: 20,) ,
        ProductListView( bloc,  categoryStateBase!)

      ],);
    return column;
  }

  //----------------------------------------------------------------- background view

  Widget backgroundLinearColorLevel() {
    double w = DeviceTools.getWidth(context);
    double h = 120 + 90;

    return Container(
      width: w,
      height: h, //60
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1,  0.7],
            colors: [
              ColorProject.green_start,
              ColorProject.green_light
            ],
          )
      ),
      child:  SizedBox(width: w, height: h,),
    );
  }
}