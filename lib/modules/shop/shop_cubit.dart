import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie_odc/layout/shop/shop_screens/blogs_screen.dart';
import 'package:la_vie_odc/layout/shop/shop_screens/home_screen.dart';
import 'package:la_vie_odc/layout/shop/shop_screens/notifications_screen.dart';
import 'package:la_vie_odc/layout/shop/shop_screens/profile_screen.dart';
import 'package:la_vie_odc/layout/shop/shop_screens/scan_screen.dart';
import 'package:la_vie_odc/models/all_products/products_model.dart';
import 'package:la_vie_odc/models/community/blogs_model.dart';
import 'package:la_vie_odc/shared/components/constants.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../network/remote/dio_helper.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  List<Widget> bottomNavBarScreens = [
    BlogsScreen(),
    ScanScreen(),
    HomeScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNav());
  }

   ProductsModel? productsModel;
  BlogsModel? blogsModel;
  Map<int,bool> shoppingCart= {};

  void getAllProducts() {
    emit(ShopLoadingHomeData());
    DioHelper.getData(query: null, path: PRODUCTS,token: token).then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      print(value.toString());

      // productsModel?.data?.forEach((element) {
      //   shoppingCart.addAll({
      //     int.parse(element.productId.toString()): element.
      //   })
      // });
      emit(ShopSuccessHomeData());
      print(productsModel!.data.toString());
    }).catchError((onError) => print(onError));
  }
  void getAllBlogs() {
    emit(BlogsLoading());
    DioHelper.getData(query: null, path: BLOGS,token: token).then((value) {
      blogsModel = BlogsModel.fromJson(value.data);
      print(value.toString());

      // productsModel?.data?.forEach((element) {
      //   shoppingCart.addAll({
      //     int.parse(element.productId.toString()): element.
      //   })
      // });
      emit(ShopSuccessHomeData());
      // print(productsModel!.data.toString());
    }).catchError((onError) => print(onError));
  }

}
