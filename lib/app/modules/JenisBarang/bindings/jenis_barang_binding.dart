import 'package:get/get.dart';

import '../controllers/jenis_barang_controller.dart';

class JenisBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JenisBarangController>(
      () => JenisBarangController(),
    );
  }
}
