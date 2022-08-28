import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/ui/navigation/m/ItemNavigationFastor.dart';
import 'package:troylab/screens/WalletPage/WalletPage.dart';
import 'package:troylab/screens/home/HomePage.dart';
import 'package:troylab/screens/menuPage/MenuPage.dart';
import 'package:troylab/screens/orders/OrdersPage.dart';
import 'package:troylab/screens/salesPage/SalesPage.dart';



class DataNavigationFastor {


  //active now
  static int activeIndex = 1; //here is the default button index


  //list of navigation
  static List<ItemNavigationFastor> listItemNavigation = [

    ItemNavigationFastor(position: 0, title: "المزيد", goToPage: MenuPage(  ), iconData: Icons.menu ),
    ItemNavigationFastor(position: 1, title: "الطلبات", goToPage:  OrdersPage("الطلبات"), iconData: Icons.shopping_cart),
    ItemNavigationFastor(position: 2, title: "المبيعات", goToPage:  SalesPage( ), iconData: Icons.file_copy_sharp),
    ItemNavigationFastor(position: 3, title: "المحفظة", goToPage:  WalletPage( ), iconData: Icons.wallet),
    ItemNavigationFastor(position: 4, title: "الرئسية", goToPage:  HomePage( ), iconData: Icons.home),
  ];


  //colors
  static Color colorUnSelected_text = ColorProject.grey;
  static Color colorSelected_text = ColorProject.green_deep;
  static Color colorUnSelected_line = ColorProject.white;
  static Color colorSelected_line = ColorProject.green_deep; //greyDark
  static Color colorBackgroundNavigation = ColorProject.white;


}