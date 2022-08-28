import 'package:troylab/data/model/MProduct.dart';

class  MockProduct {

  static List<MProduct> getListAll() {
    List<MProduct> ls = [];
    ls.add( MProduct( 1, 1, "بيتزا بالشبسي", 5.5, "prod_lays", 10, 100));
    ls.add( MProduct( 2, 3, "عصير طبيعي", 4.5, "prod_juice", 20, 200));
    ls.add( MProduct( 3, 2, "شكولاته ام اند ام", 15.5, "prod_mm", 30, 300));
    ls.add( MProduct( 4, 2, "بريو", 9.5, "prod_porio", 40, 400));
    return ls;
  }



}