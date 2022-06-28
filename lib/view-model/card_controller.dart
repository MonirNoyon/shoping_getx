
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/model/product_model.dart';

class CardController extends GetxController{
  static CardController instance = Get.find();
  var productCartItems = <ProductModel>[].obs;

  addCartItems(ProductModel productModel) async{
    if(_isItemsAdded(productModel)){
     Get.snackbar("Already Added", "Please Check your Card");
    }else{
      productCartItems.add(productModel);
      Get.snackbar("Successfully Added", "Please Check your Card");
    }

  }

  bool _isItemsAdded(ProductModel productModel)=>productCartItems.where((item) => item.id == productModel.id).isNotEmpty;

}

