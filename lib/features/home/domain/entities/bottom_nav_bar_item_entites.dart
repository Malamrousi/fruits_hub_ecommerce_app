import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class BottomNavBarItemEntity{
String activeImage , inActiveImage;
final String title;
BottomNavBarItemEntity({required this.activeImage,required this.inActiveImage,required this.title});


}

List<BottomNavBarItemEntity> bottomNavBarItems = [
  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldHome, 
  inActiveImage: Assets.imagesBottomBarIconOutlineHome,
   title: isArabic() ? "الرئيسية" : "Home"),

  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldProducts,
  inActiveImage: Assets.imagesBottomBarIconOutlineProducts,
   title: isArabic() ? "المنتجات" : "Products"),

  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldShoppingCart,
  inActiveImage: Assets.imagesBottomBarIconOutlineShoppingCart,
   title: isArabic() ? "السلة" : "Cart"),

  BottomNavBarItemEntity(activeImage: Assets.imagesBottomBarIconBoldUser,
  inActiveImage: Assets.imagesBottomBarIconOutlineUser,
   title: isArabic() ? "المستخدم" : "User"),
];