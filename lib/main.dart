import 'package:add_data/home/binding/home_bindings.dart';
import 'package:add_data/home/views/home_view.dart';
import 'package:add_data/record/views/record_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'เพิ่มข้อมูล',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomeView(),
          // binding: HomeBinding(),
        ),
        GetPage(
          name: '/record',
          page: () => RecordView(),
          // binding: HomeBinding(),
        ),
      ],
    );
  }
}
