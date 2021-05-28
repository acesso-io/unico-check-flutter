import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'acesso_bio_camera_normal_controller.dart';

class AcessoBioCameraNormalScreen extends GetView<AcessoBioCameraNormalController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.openCamera,
          icon: Icon(Icons.camera, size: 18),
          label: Text('Abrir a camera normal'),
        ),
      ],
    );
  }
}