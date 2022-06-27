import 'package:http/http.dart' as http;
import 'package:shoping_getx/model/product_model.dart';
class RemoteServices{

  static var client = http.Client();

  static Future<List<ProductModel>> fetchProduct()async{
    var response =await client.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

    if(response.statusCode==200){
      return productModelFromJson(response.body);
    }else{
      return [];
    }
  }
}