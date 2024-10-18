import 'package:common/src/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

runPetrelApp({
  required String initialRoute,
  required List<GetPage> getPages,
  String? title,
}) {
  AppPages.registerRoute(getPages);
  runApp(
    GetMaterialApp(
      title: title ?? "Application",
      initialRoute: initialRoute,
      getPages: getPages,
      builder: FlutterSmartDialog.init(),
      navigatorObservers: [FlutterSmartDialog.observer],
    ),
  );
}
