import 'package:display_data_from_api/product_module/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService 
{
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    final Uri url = Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie');

    // final response =
    // await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));
    var response = await client.get(url);
    
    if (response.statusCode == 200) 
    {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    } 
    else {
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }

  }
}