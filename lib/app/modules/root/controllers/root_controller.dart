import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class RootController extends GetxController {
  var homeHotFix = ''.obs;

  Future<void> downloadHotFix() async {
    final downloadUrl = 'http://192.168.2.2:5500/webApp/web_app/build/web.zip';
    print(downloadUrl);
    SmartDialog.showLoading();
    try {
      await HotAssetDownload(moduleName: 'home', url: downloadUrl).download();
      SmartDialog.dismiss();
      homeHotFix.value = await getApplicationDocumentsDirectory()
          .then((value) => join(value.path, 'home', 'web'));
    } catch (e) {
      print(e);
      SmartDialog.dismiss();
    }
  }
}
