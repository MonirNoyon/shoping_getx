import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10))
                    ),
                    child: Image.network("https://mir-s3-cdn-cf.behance.net/projects/404/77f51075510351.Y3JvcCw4NjIsNjc1LDE2NCww.png",fit: BoxFit.cover,)),
                Positioned(
                    right: -5,
                    top: -8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
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
                  Text("This is Super First Laptop",
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
                      children: [
                        Text(" 4.5 ",style: TextStyle(fontSize: 18,color: Colors.white),),
                        Icon(Icons.star,color: Colors.white,)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("\u0024 256.56",style: TextStyle(fontSize: 25),),

                ],
              ),
            )
          ],
        )
    );
  }
}




