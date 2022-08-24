part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopChangeBottomNav extends ShopState {}
class ShopLoadingHomeData extends ShopState {}
class ShopSuccessHomeData extends ShopState {}

class BlogsLoading extends ShopState {}
class BLogsSuccess extends ShopState {}

