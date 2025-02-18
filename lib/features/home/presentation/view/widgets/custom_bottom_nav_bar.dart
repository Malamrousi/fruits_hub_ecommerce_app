import 'package:flutter/material.dart';

import 'package:fruit_hub/features/home/domain/entities/bottom_nav_bar_item_entites.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/nav_bar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}


class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: bottomNavBarItems.asMap().entries.map((entry){
          var index = entry.key;
          var item = entry.value;
          return Expanded(
            flex: currentIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: NavBarItem(
                isSelected: currentIndex == index,
                bottomNavBarItemEntity: item,
              ),
            ),
          );
        }
      ).toList(),
     ));
  }
}
