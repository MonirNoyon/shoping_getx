import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shoping_getx/view/products_item.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
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
              child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: 9,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return ProductsItem();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
