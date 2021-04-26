import 'package:get/get.dart';
import 'package:unico_check_example/navigation/bindings/acesso_bio_auth.binding.dart';
import 'package:unico_check_example/navigation/bindings/acesso_bio_camera.binding.dart';
import 'package:unico_check_example/navigation/bindings/home.binding.dart';
import 'package:unico_check_example/screens/aceeso_bio_document/acesso_bio_document.screen.dart';
import 'package:unico_check_example/screens/acesso_bio_auth/acesso_bio_auth.screen.dart';
import 'package:unico_check_example/screens/acesso_bio_camera/acesso_bio_camera.screen.dart';
import 'package:unico_check_example/screens/home/home.screen.dart';
import 'bindings/acesso_bio_document.binding.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ACESSO_BIO_CAMERA,
      page: () => AcessoBioCameraScreen(),
      binding: AcessoBioCameraBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ACESSO_BIO_DOCUMENT,
      page: () => AcessoBioDocumentScreen(),
      binding: AcessoBioDocumentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ACESSO_BIO_AUTH,
      page: () => AcessoBioAuthScreen(),
      binding: AcessoBioAuthBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
