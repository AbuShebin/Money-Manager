import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money_management_app/home/Screen_home.dart';

class bottom_navigation extends StatelessWidget {
  const bottom_navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Screen_home.selectedindexnotifier,
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
                  Screen_home.selectedindexnotifier.value = newindex;
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
                    icon: Icon(Icons.album_outlined),
                    label: 'Budget',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.pie_chart),
                    label: 'stats',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
