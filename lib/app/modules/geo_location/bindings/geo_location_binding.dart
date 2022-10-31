import 'package:get/get.dart';

import '../controllers/geo_location_controller.dart';

class GeoLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeoLocationController>(
      () => GeoLocationController(),
    );
  }
}
