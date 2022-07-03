import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/model/product_model.dart';
import 'package:shoping_getx/view-model/controller.dart';
import 'package:shoping_getx/view/widget/card_page.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key,required this.products});
 ProductModel products;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Details",style: TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back,color: Colors.black,),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=> Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: size.height*0.34,
                  width: size.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: NetworkImage(productsController.productsList[data].imageLink),
                        fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=> Text(productsController.productsList[data].productType,style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),)),
                        Obx(()=>InkWell(
                          onTap: (){
                            productsController.productsList[data].isFavourite.toggle();
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                              height: 40,
                              width: 40,
                              child: productsController.productsList[data].isFavourite.value
                                  ? const Icon(CupertinoIcons.heart_fill,color: Colors.redAccent,)
                                  : const Icon(CupertinoIcons.heart,color: Colors.redAccent,),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                        ),
                        )
                      ],
                    ),
                   Text("\u0024 ${productsController.productsList[data].price}",
                      style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    Text("Rating : ${productsController.productsList[data].rating}",
                    style: const TextStyle(fontSize: 18),),
                    const Text("Description",style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),),

                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                      ),
                      child: Text(productsController.productsList[data].description),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              margin: EdgeInsets.only(left: 8,bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black26
                )
              ),
              child: IconButton(
                onPressed: (){
                  cardController.addCartItems(products);
                },
                icon: Icon(CupertinoIcons.cart_badge_plus),
              ),
            ),
            SizedBox(
              width: 25,
              height: 5,
            ),

            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15,right: 12),
                    height: 50,
                    width: size.width*0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepPurpleAccent.withOpacity(0.8)
                    ),
                    child: Center(
                      child: Text("Boy Now",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
