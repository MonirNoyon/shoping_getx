import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/view-model/card_controller.dart';
import 'package:shoping_getx/view-model/controller.dart';
import 'package:shoping_getx/view-model/product_controller.dart';
import 'package:shoping_getx/view/products_item.dart';
import 'package:shoping_getx/view/widget/bottom_nav_bar.dart';
import 'package:shoping_getx/view/widget/card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                    child: Text(
                  "ShopX",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
              ],
            ),
            Expanded(
              child: Obx(
                () => productsController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          mainAxisExtent: size.height * 0.42,
                        ),
                        itemCount: productsController.productsList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ProductsItem(
                              products: productsController.productsList[index],index: index,);
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
