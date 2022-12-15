import 'package:get/get.dart';

import '../controllers/barang_masuk_controller.dart';

class BarangMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarangMasukController>(
      () => BarangMasukController(),
    );
  }
}
