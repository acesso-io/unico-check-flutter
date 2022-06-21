import 'package:flutter_test/flutter_test.dart';
import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';
import 'package:unico_check/src/unico/adapter/repository/mappers/unico.theme.mapper.dart';

import '../../../test_dummy.dart';

void main() {
  late UnicoThemeMapper mapper;

  setUp(() {
    mapper = UnicoThemeMapper();
  });

  test(
    'should map UnicoTheme when call map method',
    () {
      final unicoTheme = UnicoTheme(
        colorBackground: dummyString,
        colorBackgroundBottomDocument: dummyString,
        colorBackgroundButtonPopupError: dummyString,
        colorBackgroundPopupError: dummyString,
        colorBackgroundTakePictureButton: dummyString,
        colorBoxMessage: dummyString,
        colorIconTakePictureButton: dummyString,
        colorSilhouetteError: dummyString,
        colorSilhouetteNeutral: dummyString,
        colorSilhouetteSuccess: dummyString,
        colorTextBottomDocument: dummyString,
        colorTextButtonPopupError: dummyString,
        colorTextMessage: dummyString,
        colorTextPopupError: dummyString,
      );

      final result = mapper.map(unicoTheme);

      expect(result['colorBackground'], unicoTheme.colorBackground);
      expect(result['colorBackgroundBottomDocument'], unicoTheme.colorBackgroundBottomDocument);
      expect(result['colorBackgroundButtonPopupError'], unicoTheme.colorBackgroundButtonPopupError);
      expect(result['colorBackgroundPopupError'], unicoTheme.colorBackgroundPopupError);
      expect(result['colorBackgroundTakePictureButton'], unicoTheme.colorBackgroundTakePictureButton);
      expect(result['colorBoxMessage'], unicoTheme.colorBoxMessage);
      expect(result['colorIconTakePictureButton'], unicoTheme.colorIconTakePictureButton);
      expect(result['colorSilhouetteError'], unicoTheme.colorSilhouetteError);
      expect(result['colorSilhouetteNeutral'], unicoTheme.colorSilhouetteNeutral);
      expect(result['colorSilhouetteSuccess'], unicoTheme.colorSilhouetteSuccess);
      expect(result['colorTextBottomDocument'], unicoTheme.colorTextBottomDocument);
      expect(result['colorTextButtonPopupError'], unicoTheme.colorTextButtonPopupError);
      expect(result['colorTextMessage'], unicoTheme.colorTextMessage);
      expect(result['colorTextPopupError'], unicoTheme.colorTextPopupError);
    },
  );
}
