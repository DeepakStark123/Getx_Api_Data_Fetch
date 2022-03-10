import 'package:display_data_from_api/common_module/AppColor.dart';
import 'package:display_data_from_api/common_module/AppString.dart';
import 'package:display_data_from_api/product_module/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);
  final ProductController productController = Get.put(
    ProductController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.fetchApiData),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                var data = productController.productList[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              data.imageLink,
                              width: 150,
                              height: 100,
                              fit: BoxFit.fill,
                              color: AppColor.purpleColor,
                              colorBlendMode: BlendMode.color,
                            ),
                          ),
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              data.brand,
                              style: const TextStyle(
                                  fontSize: 14, color: AppColor.grey),
                            ),
                            Text(
                              data.category,
                              style: const TextStyle(
                                  fontSize: 14, color: AppColor.grey),
                            ),
                          ],
                        )),
                      ],
                    ),
                    Container(
                      color: AppColor.grey200,
                      height: 2,
                    ),

                  ],
                );
              });
        }
      }),
    );
  }
}
