import 'package:ecommerec_app/core/utils/app_color.dart';
import 'package:ecommerec_app/core/utils/constants.dart';
import 'package:ecommerec_app/ui/category/presentation/category_view.dart';
import 'package:ecommerec_app/ui/favorite/prsentation/favorites_view.dart';
import 'package:ecommerec_app/ui/home/presentation/home_view.dart';
import 'package:ecommerec_app/ui/profile/presentation/profile_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.grey,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: ImageIcon(
                AssetImage(ImagePath.home),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Category',
              icon: ImageIcon(
                AssetImage(ImagePath.category),
              ),
            ),
            BottomNavigationBarItem(
                label: 'favorite',
                icon: ImageIcon(AssetImage(ImagePath.favorite))),
            BottomNavigationBarItem(
                label: 'profile',
                icon: ImageIcon(AssetImage(ImagePath.profile)))
          ],
        ),
        body: Tabs[selectedIndex],
      ),
    );
  }

  List<Widget> Tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];
}
