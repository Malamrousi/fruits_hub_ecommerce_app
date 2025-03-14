import 'package:flutter/material.dart';

import '../../../domain/entities/bottom_nav_bar_item_entites.dart';
import 'active_item.dart';
import 'in_active_item.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity  bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.title,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}