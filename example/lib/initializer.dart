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
      setTimeoutToFaceInference: 16.0,

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
      androidColorSilhouetteError: "#DEB887",

      //iOS
      iosColorBackground: "#708090",
      iosColorBoxMessage: "#b434eb",
      iosColorTextMessage: "#000000",
      iosColorBackgroundPopupError: "#8B4513",
      iosColorTextPopupError: "#BC8F8F",
      iosColorBackgroundButtonPopupError: "#0080ff",
      iosColorTextButtonPopupError: "#F4A460",
      iosColorBackgroundTakePictureButton: "#FFDEAD",
      iosColorIconTakePictureButton: "#000000",
      iosColorBackgroundBottomDocument: "#DEB887",
      iosColorTextBottomDocument: "#D2B48C",
      iosColorSilhouetteSuccess: "#7B68EE",
      iosColorSilhouetteError: "#DEB887",
    );
    Get.put(unicoInit);
  }
}
