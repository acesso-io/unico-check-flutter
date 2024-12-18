import 'package:unico_check/src/unico/domain/entities/unico.theme.dart';

class UnicoThemeMapper {
  Map<dynamic, dynamic> map(UnicoTheme unicoTheme) {
    return <String, dynamic>{
      /// Cor de sucesso da silhueta.
      'colorBackground': unicoTheme.colorBackground,

      /// Cor de fundo da mensagem.
      'colorBoxMessage': unicoTheme.colorBoxMessage,

      /// Cor de texto da mensagem.
      'colorTextMessage': unicoTheme.colorTextMessage,

      /// Cor de fundo do popup.
      'colorBackgroundPopupError': unicoTheme.colorBackgroundPopupError,

      /// Cor de texto e ícones do popup.
      'colorTextPopupError': unicoTheme.colorTextPopupError,

      /// Cor de fundo do botão do popup.
      'colorBackgroundButtonPopupError':
          unicoTheme.colorBackgroundButtonPopupError,

      /// Cor de texto do botão do popup.
      'colorTextButtonPopupError': unicoTheme.colorTextButtonPopupError,

      /// Cor de fundo do botão de tirar foto manualmente.
      'colorBackgroundTakePictureButton':
          unicoTheme.colorBackgroundTakePictureButton,

      /// Cor de ícone do botão de tirar foto manualmente.
      'colorIconTakePictureButton': unicoTheme.colorIconTakePictureButton,

      /// Adiciona cor no icone do botão de captura
      'colorBackgroundBottomDocument': unicoTheme.colorBackgroundBottomDocument,

      /// Cor de fundo do box na captura de documentos.
      'colorTextBottomDocument': unicoTheme.colorTextBottomDocument,

      /// Cor de sucesso da silhueta.
      'colorSilhouetteSuccess': unicoTheme.colorSilhouetteSuccess,

      /// Cor de sucesso da silhueta.
      'colorSilhouetteError': unicoTheme.colorSilhouetteError,

      /// Cor de erro da silhueta.
      'colorSilhouetteNeutral': unicoTheme.colorSilhouetteNeutral,

      /// Cor do ícone da animação durante progresso de carregamento.
      'colorProgressBar': unicoTheme.colorProgressBar,

      /// Cor do botão de cancelar.
      'colorCancelButtonIcon': unicoTheme.colorCancelButtonIcon
    };
  }
}
