import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'acesso_bio_document.controller.dart';

class AcessoBioDocumentScreen extends GetView<AcessoBioDocumentController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.openCameraDocument,
          icon: Icon(Icons.pages, size: 18),
          label: Text('Abrir a camera para documento na UNICO'),
        ),
      ],
    );
  }
}