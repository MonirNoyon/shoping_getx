import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_getx/view-model/controller.dart';
import 'package:shoping_getx/view/pages/account_page.dart';
import 'package:shoping_getx/view/pages/home_page.dart';
import 'package:shoping_getx/view/widget/bottom_nav_bar.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/view/widget/card_page.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.dehaze_sharp,
          color: Colors.black,
        ),
        onPressed: (){

        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
                    ),
                    builder: (context)=>Wrap(
                      children: [
                        CardPage()
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                  right: 5,
                  top: 1,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Obx(()=>Text("${cardController.productCartItems.length}"))),
                  )
              )
            ],
          ),
        )
      ],
    ),
      body: Obx(()=>IndexedStack(
          index: bottomNavBarController.tabIndex.value,
          children: const[
            HomePage(),
            Center(child: Text("Buy Page")),
            Center(child: Text("Wishlist")),
            Account(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(CupertinoIcons.chat_bubble_2_fill,size: 32,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
