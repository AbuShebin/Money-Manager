import 'package:flutter/material.dart';
import 'package:money_management_app/core/theme/app_pallette.dart';
import 'package:money_management_app/core/theme/app_theme.dart';
import 'package:money_management_app/home/Screen_home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Screenhome.selectedindexnotifier,
      builder: (BuildContext ctx, int updatedindex, Widget? _) {
        return ClipRRect(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: updatedindex,
            unselectedItemColor: AppPallette.popWhite100,
            onTap: (newindex) {
              Screenhome.selectedindexnotifier.value = newindex;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'transactions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart),
                label: 'Stats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              )
            ],
          ),
        );
      },
    );
  }
}
