import 'package:get/get.dart';
import 'package:shoping_getx/model/product_model.dart';
import 'package:shoping_getx/services/remote_services.dart';


class ProductsController extends GetxController{
  static ProductsController instance = Get.find();
  var isLoading = true.obs;
  var productsList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading(true);
      var products = await RemoteServices.fetchProduct();
      if(products!=[]){
        productsList.value = products;
      }else{

      }
    }finally{
      isLoading(false);
    }
  }
}