import 'package:get/get.dart';
import 'package:unico_check/unico_check.dart';

class Initializer {
  static void init() {
    _initUnico();
  }

  static void _initUnico() {
    final unicoInit = UnicoConfig(
      //Time
      setTimeoutSession: 50.0,
      setTimeoutToFaceInference: 50.0,

      //Android
      androidColorSilhoutte: "#0080ff",
      // androidColorBackground: "#0080ff",
      // androidColorBoxMessage: "#0080ff",
      // androidColorTextMessage: "#0080ff",
      // androidColorBackgroundPopupError: "#0080ff",
      // androidColorTextPopupError: "#0080ff",
      // androidColorBackgroundButtonPopupError: "#0080ff",
      // androidColorTextButtonPopupError: "#0080ff",
      // androidColorBackgroundTakePictureButton: "#0080ff",
      // androidColorIconTakePictureButton: "#0080ff",
      // androidColorBackgroundBottomDocument: "#0080ff",
      // androidColorTextBottomDocument: "#0080ff",

      //iOS
      // iosColorSilhoutteNeutra: "#0080ff",
      iosColorSilhoutteSuccess: "#0080ff",
      // iosColorSilhoutteError: "#0080ff",
      // iosColorBackground: "#0080ff",
      // iosColorBackgroundBoxStatus: "#0080ff",
      // iosColorTextBoxStatus: "#0080ff",
      // iosColorBackgroundPopupError: "#0080ff",
      // iosColorTextPopupError: "#0080ff",
      // iosImageIconPopupError: "#0080ff",
    );
    Get.put(unicoInit);
  }
}
