import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:home/app/modules/home/bindings/home_binding.dart';
import 'package:home/app/modules/home/views/home_view.dart';
import 'package:petrel_app_example/app/modules/root/bindings/root_binding.dart';
import 'package:petrel_app_example/app/modules/root/views/root_view.dart';

void main() {
  runPetrelApp(initialRoute: '/root', getPages: [
    GetPage(
      name: '/root',
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/dynamic',
      page: () => const DynamicPage(),
      binding: DynamicPageBinding(),
    )
  ]);
}
