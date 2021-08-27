class ResponseConstants {
  ///on error de cada função openCamera e OpenDocument
  static const String onError = "onError";

  ///usuario fechou a camera manualmente
  static const String onUserClosedCameraManually = "onUserClosedCameraManually";

  ///erro ao tentar abrir a camera
  static const String onErrorAcessoBio = "onErrorAcessoBio";

  ///tempo de cessão encerrou
  static const String onSystemClosedCameraTimeoutSession =
      "onSystemClosedCameraTimeoutSession";

  ///tempo de cessão da camera inteligente encerrou
  static const String onSystemChangedTypeCameraTimeoutFaceInference =
      "onSystemChangedTypeCameraTimeoutFaceInference";

  ///on success selfie
  static const String onSuccessSelfie = "onSuccessSelfie";

  ///on error selfie
  static const onErrorSelfie = "onErrorSelfie";

  ///on success document
  static const onSuccessDocument = "onSuccessDocument";

  ///on error document
  static const onErrorDocument = "onErrorDocument";
}
