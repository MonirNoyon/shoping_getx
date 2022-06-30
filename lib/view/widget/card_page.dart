import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/model/product_model.dart';
import 'package:shoping_getx/view-model/controller.dart';

class CardPage extends StatelessWidget {
  CardPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.85,
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Shopping Cart",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Obx(() => Column(
            children: cardController.productCartItems
                .map((cardItems) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.network(
                      cardItems.imageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 14),
                            child:  Text(cardItems.name,overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w500),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.chevron_left),
                                onPressed: () {

                                  cardController.decreaseQuantity(cardItems);
                                }),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(()=>Text(
                                cardItems.quantity.value.toString(),
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              ),
                            ),
                            IconButton(
                                icon: const Icon(Icons.chevron_right),
                                onPressed: () {
                                  cardController.increaseQuantity(cardItems);
                                }),
                          ],
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Obx(()=>Text(
                    (cardItems.quantity.value*double.parse(cardItems.price)).toStringAsFixed(2),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  )),
                ),
              ],
            ))
                .toList(),
          )),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                customBorder: const StadiumBorder(),
                child: Container(
                    child: Center(
                        child: Obx(
                              () => Text(
                            "Pay  \u0024 ${cardController.totalAmount.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
