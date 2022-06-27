import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_getx/model/product_model.dart';

class ProductsItem extends StatelessWidget {
   ProductsItem({Key? key,required this.products});
   ProductModel products;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width*0.45,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10))
                    ),
                    child: Image.network(products.imageLink,
                    fit: BoxFit.cover,)),
                Positioned(
                    right: -5,
                    top: -5,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.favorite_border,color: Colors.redAccent,),
                      ),
                    )
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(products.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 35,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.greenAccent
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(products.rating.toString()+" ",style: TextStyle(fontSize: 18,color: Colors.white),),
                        Icon(Icons.star,color: Colors.white,)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("\u0024 ${products.price}",style: TextStyle(fontSize: 25),),

                ],
              ),
            )
          ],
        )
    );
  }
}




