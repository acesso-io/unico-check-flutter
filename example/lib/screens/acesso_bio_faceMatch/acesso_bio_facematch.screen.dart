import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'acesso_bio_facematch.controller.dart';


class AcessoBioFaceMatchScreen extends GetView<AcessoBioFaceMatchController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.openFaceMatch,
          icon: Icon(Icons.camera, size: 18),
          label: Text('Abrir a FaceMatch'),
        ),
      ],
    );
  }
}
