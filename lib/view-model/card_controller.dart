
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/model/product_model.dart';
import 'package:shoping_getx/view-model/controller.dart';

class CardController extends GetxController{
  static CardController instance = Get.find();

  var productCartItems = <ProductModel>[].obs;
  var cartTotalPriceItems = <ProductModel>[].obs;
  //double get Price => productCartItems.fold(0, (sum, items) => sum + double.parse(items.price));
  double get totalAmount => cartTotalPriceItems.fold(0, (sum, items) => sum + double.parse(items.price));

  
  addCartItems(ProductModel productModel) async{
    if(_isItemsAdded(productModel)){
     Get.snackbar("Already Added", "Please Check your Card",animationDuration: const Duration(milliseconds: 600));
    }else{
      productCartItems.add(productModel);
      cartTotalPriceItems.add(productModel);
      Get.snackbar("Successfully Added", "Please Check your Card");
    }

  }

  int increaseQuantity(ProductModel productModel){
    cartTotalPriceItems.add(productModel);
    var quantity = productModel.quantity++;
    return quantity.value;
  }
  int decreaseQuantity(ProductModel productModel){
    var quantity = productModel.quantity;
    if(quantity > 1){
      cartTotalPriceItems.remove(productModel);
      quantity = productModel.quantity--;
    }else{
      cartTotalPriceItems.remove(productModel);
      productCartItems.remove(productModel);
      Get.snackbar("Deleted Successfully", "Card Item deleted.");
    }
    return quantity.value;
  }


  bool _isItemsAdded(ProductModel productModel)=>productCartItems.where((item) => item.id == productModel.id).isNotEmpty;

}


