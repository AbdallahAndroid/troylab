import 'package:troylab/data/model/MCategory.dart';

class MockCategory {

  static List<MCategory> getListAll() {
    List<MCategory> ls = [];
    ls.add( MCategory( 0, "الكل", "") );
    ls.add( MCategory( 1, "بيتزا", "cat_pizza") );
    ls.add( MCategory( 2, "سندوتشات", "cat_burger") );
    ls.add( MCategory( 3, "مشروبات", "cat_drink") );
    // ls.add( MCategory( 4, "مخبوزات", "cat_drink") );
    return ls;
  }
}