import 'package:flutter/material.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const CircularNotchedRectangle(),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white,primaryColor: Colors.grey),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Buy"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Wishlist"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                label: "Account"
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          elevation: 0.0,
        ),
      ),
    );
  }
}
