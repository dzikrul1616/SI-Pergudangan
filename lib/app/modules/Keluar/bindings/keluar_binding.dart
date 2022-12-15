import 'package:get/get.dart';

import '../controllers/keluar_controller.dart';

class KeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeluarController>(
      () => KeluarController(),
    );
  }
}
