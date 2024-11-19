import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controllers.dart';
import '../menus/favorite_menu.dart';
import '../menus/home_menu_tablet.dart';
import '../menus/profile_menu.dart';


class DashboardPageRail extends StatelessWidget {
  const DashboardPageRail({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardControllers navController = Get.find();
    final List<Widget> menus = [
      HomeMenuTablet(),
      FavoriteMenu(),
      ProfileMenu()
    ];

    return Scaffold(
      body: Row(
        children: [
          Obx(() =>NavigationRail(
            selectedIndex: navController.selectedindex.value,
            onDestinationSelected: (int index) {
              navController.changeMenu(index);
            },
            selectedIconTheme: IconThemeData(color: Colors.blueAccent),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            indicatorColor: Colors.white,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                label: Text(
                  "Home",
                  style: TextStyle(
                    color: navController.selectedindex.value == 0 ? Colors.blueAccent : Colors.grey,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text(
                  "Favorite",
                  style: TextStyle(
                    color: navController.selectedindex.value == 2 ? Colors.blueAccent : Colors.grey,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text(
                  "Profile",
                  style: TextStyle(
                    color: navController.selectedindex.value == 3 ? Colors.blueAccent : Colors.grey,
                  ),
                ),
              ),

            ],
            backgroundColor: Colors.white,
            labelType: NavigationRailLabelType.all, // Sembunyikan label teks
            groupAlignment: 0.0,
          )
          ),
          Expanded(child: Obx(() {
            return menus[navController.selectedindex.value];
          }))
        ],
      ),
    );
  }
}
