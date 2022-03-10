import 'package:display_data_from_api/common_module/AppColor.dart';
import 'package:display_data_from_api/product_module/views/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common_module/AppString.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.fetchApiData,
      theme: ThemeData(
        primarySwatch: AppColor.purpleColor,
      ),
      debugShowCheckedModeBanner: false,
      home: ProductListView(),
    );
  }
}

