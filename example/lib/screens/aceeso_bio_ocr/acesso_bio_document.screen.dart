import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'acesso_bio_ocr.controller.dart';


class AcessoBioOcrScreen extends GetView<AcessoBioOcrController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.openCameraOcr,
          icon: Icon(Icons.pages, size: 18),
          label: Text('Abrir a camera para OCR na UNICO'),
        ),
      ],
    );
  }
}