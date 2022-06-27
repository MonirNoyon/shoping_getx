import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/view-model/product_controller.dart';
import 'package:shoping_getx/view/products_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductsController productsController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.dehaze_sharp,color: Colors.black,),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,color: Colors.black,),
            onPressed: (){},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("ShopX",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.list)),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.qr_code)),
              ],
            ),
            Expanded(
              child: Obx(()=> GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      mainAxisExtent: size.height*0.4,
                    ),
                    itemCount: productsController.productsList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return ProductsItem(products: productsController.productsList[index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
