import 'package:flutter/material.dart';

class ResultCameraDocument {
    late String base64;
    late String encrypted;

    ResultCameraDocument({
      required base64,
      required encrypted,
    }) {
      this.base64 = base64;
      this.encrypted = encrypted;
    }

}