import 'package:get/get.dart';
import 'package:shoping_getx/model/product_model.dart';
import 'package:shoping_getx/services/remote_services.dart';


class ProductsController extends GetxController{
  var productsList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    var products = await RemoteServices.fetchProduct();
    if(products!=[]){
      productsList.value = products;
    }else{

    }
  }
}