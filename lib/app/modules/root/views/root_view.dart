import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('RootView'),
      //   centerTitle: true,
      // ),
      body: TDCellGroup(cells: [
        TDCell(
          title: '下载热更资源',
          onClick: (cell) {
            controller.downloadHotFix();
          },
        ),
        TDCell(
          title: '打开首页',
          onClick: (cell) {
            Get.toNamed('/home');
          },
        ),
        TDCell(
          title: '打开热修复首页',
          onClick: (cell) {
            Get.toNamed('/dynamic', arguments: {
              'documentRoot': controller.homeHotFix.value,
            });
          },
        )
      ]),
    );
  }
}
