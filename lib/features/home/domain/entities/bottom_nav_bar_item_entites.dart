import 'package:fruit_hub/core/utils/app_images.dart';

class BottomNavBarItemEntity{
String activeImage , inActiveImage;
final String title;
BottomNavBarItemEntity({required this.activeImage,required this.inActiveImage,required this.title});


}

List<BottomNavBarItemEntity> bottomNavBarItems = [
  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldHome, 
  inActiveImage: Assets.imagesBottomBarIconOutlineHome,
   title:  "الرئيسية" ),

  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldProducts,
  inActiveImage: Assets.imagesBottomBarIconOutlineProducts,
   title:  "المنتجات" ),

  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldShoppingCart,
  inActiveImage: Assets.imagesBottomBarIconOutlineShoppingCart,
   title:  "السلة" ),

  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldUser,
  inActiveImage: Assets.imagesBottomBarIconOutlineUser,
   title:  "المستخدم" ),
];