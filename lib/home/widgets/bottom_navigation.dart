import 'package:flutter/material.dart';
import 'package:money_management_app/features/settings/screens/settings_screen.dart';
import 'package:money_management_app/home/Screen_home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Screenhome.selectedindexnotifier,
      builder: (BuildContext ctx, int updatedindex, Widget? _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: BottomNavigationBar(
                backgroundColor: Colors.grey[100],
                type: BottomNavigationBarType.fixed,
                currentIndex: updatedindex,
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: Colors.black,
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
            ),
          ),
        );
      },
    );
  }
}
