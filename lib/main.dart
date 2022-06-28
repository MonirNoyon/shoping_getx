import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/view-model/card_controller.dart';
import 'package:shoping_getx/view-model/product_controller.dart';
import 'package:shoping_getx/view/pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProductsController());
  Get.put(CardController());
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      routes: {
        "/":(context)=>HomePage(),
      },
    );
  }
}

