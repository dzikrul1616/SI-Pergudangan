import 'package:get/get.dart';

import '../controllers/barang_keluar_controller.dart';

class BarangKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarangKeluarController>(
      () => BarangKeluarController(),
    );
  }
}
