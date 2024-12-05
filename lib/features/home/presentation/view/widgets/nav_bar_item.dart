import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/bottom_nav_bar_item_entites.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/active_item.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/in_active_item.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.isSelected, required this.bottomNavBarItemEntity});
 final bool isSelected ;
 final BottomNavBarItemEntity bottomNavBarItemEntity;  
  @override
  Widget build(BuildContext context) {
    return isSelected ?  ActiveItem(
      image:bottomNavBarItemEntity.activeImage, 
      text:bottomNavBarItemEntity.title,
    ) :  InActiveItem(
      image: bottomNavBarItemEntity
          .inActiveImage,
    );
  }
}