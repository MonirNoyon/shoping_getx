import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/view-model/controller.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircularNotchedRectangle(),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white,primaryColor: Colors.grey),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Buy"
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: "Wishlist"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  label: "Account"
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomNavBarController.tabIndex.value,
            onTap: bottomNavBarController.changeTabIndex,
            selectedItemColor: Colors.deepPurpleAccent,
            elevation: 0.0,
          ),
        ),
      ),
    );
  }
}
