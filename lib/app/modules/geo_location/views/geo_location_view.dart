import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:tsa_firebase_auth/app/modules/global/themes/color_theme.dart';
import 'package:tsa_firebase_auth/app/modules/global/themes/typography_theme.dart';
import 'package:tsa_firebase_auth/app/modules/global/widgets/drawer/main_drawer_widget.dart';
import 'package:tsa_firebase_auth/app/modules/global/widgets/text_field/regular_text_field/regular_text_field.dart';

import '../controllers/geo_location_controller.dart';

class GeoLocationView extends GetView<GeoLocationController> {
  const GeoLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lokasi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                Position userPosition =
                    await controller.getGeoLocationPosition();
                controller.getAddressFromLatLong(userPosition);
                controller.changeLocationMessage(userPosition);
              },
              child: Card(
                child: Container(
                  // width: MediaQuery.of(context).size.width - 16,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                        child: FaIcon(
                          FontAwesomeIcons.mapLocationDot,
                          color: ColorsTheme.primaryColor,
                        ),
                      ),
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lokasi Saat Ini",
                              style: TypographyTheme.titleSmall.copyWith(
                                color: ColorsTheme.neutralColor[900],
                              ),
                            ),
                            LimitedBox(
                              maxWidth: 240,
                              child: Text(
                                "${controller.addressMessage}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TypographyTheme.bodySmall.copyWith(
                                  color: ColorsTheme.neutralColor[900],
                                ),
                              ),
                            ),
                            Text(
                              "${controller.locationMessage}",
                              style: TypographyTheme.bodyRegular.copyWith(
                                color: ColorsTheme.neutralColor[900],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            RegularTextField(
              controller: controller.locationInputController,
              label: "Tujuan",
              suffixIcon: const FaIcon(FontAwesomeIcons.locationDot),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                controller.intentGoogleMaps();
              },
              child: const Text("Navigasi Tujuan"),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
