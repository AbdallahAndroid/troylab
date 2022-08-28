import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:troylab/resource/resourceProject/ColorProject.dart';
import 'package:troylab/resource/resourceProject/DrawableProject.dart';
import 'package:troylab/resource/ui/animate/TransformHelper.dart';
import 'package:troylab/screens/home/blockHomePage/category/CategoryBloc.dart';
import 'package:troylab/screens/home/views/products/ItemViewProduct.dart';

extension BarAddToCart on ItemViewProductState {

  Widget getBarAddToCart(){
      return Stack( children: [
        EmptyView.empty( itemViewProduct_frame_width , 30 ),

        Positioned(child: tvPrice(), left: 0, right: 0  ) ,

        Positioned(child:  imClickAddToCart() , right:  10 ,),

      ],);
  }

  Widget tvPrice(){
    String msg = "";
    msg += " ريال ";
    msg += widget.mProduct.price.toString();

    return TextFastor( msg ,
      fontSize: 15,
      color: ColorProject.green_light,
    );
  }

  Widget imClickAddToCart(){

    return ImageFastor(context:  context,
        assetAspectRatio: DrawableProject.images( "plus_circle"),
        onPressed: (){
          Log.i("click on add to cart ");

          animateClick();


      widget.bloc.add( HomeCartEvent( widget.mProduct.id )  );
        },
        width: 28,
        height: 28);
  }

  void animateClick() {
    TransformHelper.scale(x: 0, y: 2, z: 2, child:  imClickAddToCart() );

  }
}