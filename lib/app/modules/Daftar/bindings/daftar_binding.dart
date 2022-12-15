import 'package:get/get.dart';

import '../controllers/daftar_controller.dart';

class DaftarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarController>(
      () => DaftarController(),
    );
  }
}
