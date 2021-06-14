import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unico_check_example/screens/home/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolha uma tela para prosseguir')),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 80),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: controller.openCameraNormal,
              icon: Icon(Icons.camera, size: 18),
              label: Text('Navegar para a Câmera Normal'),
            ),
            ElevatedButton.icon(
              onPressed: controller.openCamera,
              icon: Icon(Icons.camera, size: 18),
              label: Text('Navegar para a Câmera Inteligente'),
            ),
            ElevatedButton.icon(
              onPressed: controller.openDocument,
              icon: Icon(Icons.pages, size: 18),
              label: Text('Navegar para Documentos'),
            ),
          ],
        ),
      ),
    );
  }
}