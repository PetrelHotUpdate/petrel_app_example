// import 'package:common/common.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/app/modules/home/bindings/home_binding.dart';
import 'package:home/app/modules/home/views/home_view.dart';
// import 'package:home/home.dart';

void main() {
  runPetrelApp(initialRoute: '/home', getPages: [
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ]);
  // runApp(Container(
  //   color: Colors.blue,
  // ));
}
