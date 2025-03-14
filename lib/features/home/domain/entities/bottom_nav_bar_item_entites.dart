import 'package:fruit_hub/core/utils/app_images.dart';

class BottomNavigationBarEntity{
String activeImage , inActiveImage;
final String title;
BottomNavigationBarEntity({required this.activeImage,required this.inActiveImage,required this.title});


}

List<BottomNavigationBarEntity> bottomNavBarItems = [
  BottomNavigationBarEntity(activeImage: Assets.imagesBottomBarIconBoldHome, 
  inActiveImage: Assets.imagesBottomBarIconOutlineHome,
   title:  "الرئيسية" ),

  BottomNavigationBarEntity(activeImage: Assets.imagesBottomBarIconBoldProducts,
  inActiveImage: Assets.imagesBottomBarIconOutlineProducts,
   title:  "المنتجات" ),

  BottomNavigationBarEntity(activeImage: Assets.imagesBottomBarIconBoldShoppingCart,
  inActiveImage: Assets.imagesBottomBarIconOutlineShoppingCart,
   title:  "السلة" ),

  BottomNavigationBarEntity(activeImage: Assets.imagesBottomBarIconBoldUser,
  inActiveImage: Assets.imagesBottomBarIconOutlineUser,
   title:  "المستخدم" ),
];