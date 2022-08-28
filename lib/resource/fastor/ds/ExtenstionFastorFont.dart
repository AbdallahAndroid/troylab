import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:troylab/resource/fastor/ds/DesignSystemFastor.dart';
import 'package:troylab/resource/resourceProject/FontProject.dart';

extension ExtenstionFastorFont on DesignSystemFastor {

  void initFont(){

    //normal
    DSFont.hparent = FontProject.sst_Arabic_Medium;
    DSFont.h1 = FontProject.sst_Arabic_Medium;
    DSFont.h2 = FontProject.sst_Arabic_Medium; //SemiBold
    DSFont.h3 = FontProject.sst_Arabic_Medium;
    DSFont.h4 = FontProject.sst_Arabic_Medium;

    //big title
    DSFont.h3_title = FontProject.sst_Arabic_Medium;
    DSFont.h4_title = FontProject.sst_Arabic_Medium;

    //button
    DSFont.button_large = FontProject.sst_Arabic_Medium;
    DSFont.button_small = FontProject.sst_Arabic_Medium;
  }


}