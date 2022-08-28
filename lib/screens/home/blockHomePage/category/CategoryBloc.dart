import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:troylab/data/api/FilterProductAPI.dart';
import 'package:troylab/data/global/CartHelper.dart';
import 'package:troylab/data/mock/MockCategory.dart';
import 'package:troylab/data/mock/MockProduct.dart';
import 'package:troylab/data/model/MCategory.dart';
import 'package:troylab/data/model/MProduct.dart';

//--------------------------------------------------- event

class CategoryEventBase {}
class CategoryInitialEvent extends CategoryEventBase{}
class CategoryErrorEvent extends CategoryEventBase{
  String msg;
  CategoryErrorEvent(this.msg);
}
class CategorySpecialEvent extends CategoryEventBase{
  int categoryId = 0;

  CategorySpecialEvent(int updateId ) {
    categoryId = updateId;
  }
}

class HomeCartEvent extends CategoryEventBase{

  HomeCartEvent(int addProductIdToCart ){
    bool isContain = CartHelper.mapCart.containsKey( addProductIdToCart );

    if( isContain == false ) {
      CartHelper.mapCart[ addProductIdToCart] =  1;
      return;
    }

    int qtyPrevious = CartHelper.mapCart[ addProductIdToCart]!;
    int newValueQty = qtyPrevious + 1 ;
    CartHelper.mapCart[ addProductIdToCart ] = newValueQty;
  }

}

//--------------------------------------------------- state

abstract class CategoryStateBase {
  int categoryIdSelected = 0;
  List<MProduct> listProduct = [];

}
class  CategoryInitialState extends CategoryStateBase{

  CategoryInitialState(){
    categoryIdSelected = 0;

    listProduct = MockProduct.getListAll();
  }
}
class CategoryErrorState extends CategoryStateBase{

  String msgError;

  CategoryErrorState( this.msgError ) {
    Log.i( "CategoryBloc - CategoryErrorState() - msgError: " + msgError );
    /**
     * now there is no data to show
     */
      categoryIdSelected = -1;
      listProduct = [];
  }
}

class CategorySpecialState extends CategoryStateBase {

  CategorySpecialState(int updateCategoryId , List<MProduct> updateListProduct)  {
    categoryIdSelected = updateCategoryId;
    listProduct = updateListProduct;
  }
}

//--------------------------------------------------- bloc logic

class CategoryBloc extends Bloc<CategoryEventBase, CategoryStateBase > {

  CategoryBloc(  ) : super( CategoryInitialState() ){

    on<CategoryInitialEvent>(getCategoryInitialEvent);
    on<CategorySpecialEvent>(getCategorySpecialEvent);
  }

  // void setDefaultData(   ){
  //   CategoryInitialState();
  // }

  Future<void> getCategoryInitialEvent(event, emit) async {
    emit(  CategoryInitialState() );
  }


  Future<void> getCategorySpecialEvent(CategorySpecialEvent event,   emit) async {
    //api
    List<MProduct> listProductFiltered = await FilterProductAPI.filterByCategory( event.categoryId );
   // Log.i( "CategoryBloc - getCategorySpecialEvent() - listProductFiltered " + listProductFiltered.length.toString() );

    //check not product found
    if( listProductFiltered.length == 0 ) {
      emit( CategoryErrorState( "لا يوجد منتجات في هذا القسم"));
      return;
    }


    //result
    emit(  CategorySpecialState( event.categoryId, listProductFiltered) );
  }

}