import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'acesso_bio_liveness.controller.dart';

class AcessoBioLivenessScreen extends GetView<AcessoBioLivenessController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.openLiveness,
          icon: Icon(Icons.camera, size: 18),
          label: Text('Abrir o liveness na UNICO'),
        ),
      ],
    );
  }
}
