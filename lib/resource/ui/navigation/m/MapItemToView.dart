import 'package:flutter/material.dart';
import 'package:troylab/resource/ui/navigation/m/DataNavigationFastor.dart';
import 'package:troylab/resource/ui/navigation/v/NavigationFastor.dart';
import 'package:troylab/resource/ui/navigation/v/views/itemTab/ItemNavigationFastorView.dart';

extension MapItemToView on NavigationFastorState {

  List<Widget> getListWidgetNavigationTab() {
    List<Widget> ls = [];

    DataNavigationFastor.listItemNavigation.forEach((itemNavigation) {

      var w = getTabItemView( itemNavigation );
      ls.add( w );
    });

    return ls;
  }

}