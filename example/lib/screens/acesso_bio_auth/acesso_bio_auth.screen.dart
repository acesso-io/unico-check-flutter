import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'acesso_bio_auth.controller.dart';

class AcessoBioAuthScreen extends GetView<AcessoBioAuthController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.openAuthentication,
          icon: Icon(Icons.camera, size: 18),
          label: Text('Abrir autenticação da UNICO'),
        ),
      ],
    );
  }
}
