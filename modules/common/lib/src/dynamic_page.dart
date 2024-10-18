import 'package:darty_json_safe/darty_json_safe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DynamicPage extends GetView<DynamicPageController> {
  const DynamicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final url = controller.loadUrl.value;
        final loadingWidget = controller.loadWidget ??
            const TDLoading(
              size: TDLoadingSize.small,
              icon: TDLoadingIcon.activity,
            );
        if (url.isEmpty) return loadingWidget;
        return InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(url)),
        );
      }),
    );
  }
}

class DynamicPageController extends GetxController {
  late InAppLocalhostServer _localhostServer;
  late Widget? loadWidget;
  var loadUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print(Get.arguments);
    final port = JSON(Get.arguments)['port'].int ?? 8080;
    final documentRoot = JSON(Get.arguments)['documentRoot'].string ?? './';
    final directoryIndex =
        JSON(Get.arguments)['directoryIndex'].string ?? 'index.html';
    final shared = JSON(Get.arguments)['shared'].bool ?? false;
    loadWidget = Get.arguments['loadWidget'];

    _localhostServer = InAppLocalhostServer(
      port: port,
      documentRoot: documentRoot,
      directoryIndex: directoryIndex,
      shared: shared,
    );
    _localhostServer.start().then((value) {
      loadUrl.value = 'http://localhost:$port/$directoryIndex';
    });
  }

  @override
  void onClose() {
    super.onClose();

    _localhostServer.close();
  }
}

class DynamicPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DynamicPageController>(() => DynamicPageController());
  }
}
