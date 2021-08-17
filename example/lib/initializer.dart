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
      androidColorBackground: "#708090",
      androidColorBoxMessage: "#B0C4DE",
      androidColorTextMessage: "#00FFFF",
      androidColorBackgroundPopupError: "#8B4513",
      androidColorTextPopupError: "#BC8F8F",
      androidColorBackgroundButtonPopupError: "#0080ff",
      androidColorTextButtonPopupError: "#F4A460",
      androidColorBackgroundTakePictureButton: "#FFDEAD",
      androidColorIconTakePictureButton: "#F5DEB3",
      androidColorBackgroundBottomDocument: "#DEB887",
      androidColorTextBottomDocument: "#D2B48C",
      androidColorSilhouetteSuccess: "#7B68EE",

      //iOS
      // iosColorSilhoutteNeutra: "#0080ff",
      // iosColorSilhoutteSuccess: "#0080ff",
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
