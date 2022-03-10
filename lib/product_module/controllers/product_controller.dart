import 'package:display_data_from_api/product_module/models/product_model.dart';
import 'package:get/get.dart';
import 'package:display_data_from_api/api_module/api_service.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if(products!=null){
        productList.assignAll(products);
      }
    }
    finally{
      isLoading(false);
    }
  }
}