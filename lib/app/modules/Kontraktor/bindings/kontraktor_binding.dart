import 'package:get/get.dart';

import '../controllers/kontraktor_controller.dart';

class KontraktorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontraktorController>(
      () => KontraktorController(),
    );
  }
}
