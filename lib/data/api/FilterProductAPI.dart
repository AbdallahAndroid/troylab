import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:troylab/data/mock/MockProduct.dart';
import 'package:troylab/data/model/MProduct.dart';

class FilterProductAPI {

  static Future<List<MProduct>> filterByCategory(int categoryId ) async {
    List<MProduct> result = [];

    //get all
    List<MProduct> listAll =  MockProduct.getListAll();

    //search
    for( int i = 0 ; i < listAll.length ; i++ ) {
      MProduct m = listAll[i];
      if( m.category_id == categoryId ) {
        result.add( m );
      }
    }

    Log.i( "FilterProductAPI - categoryId: " + categoryId.toString() + " /result: " + result.toString()  );

    return result;
  }


}