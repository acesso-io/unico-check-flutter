
# Unico Check

Esta biblioteca visa implementar a tecnologia Unico para prova de vida sob a plataforma Flutter.

## Getting Started

## Android 

Pré-requisito minSdkVersion : 21

## IOS

Pré-requisito versão 9 ou superior.

1 - Caso ainda não possua as permissões para o uso de câmera em seu projeto

`<key>NSCameraUsageDescription</key>`
`<string>Camera usage description</string>`

2 - Adicione:  `pod ‘AcessoBio’, :git => ‘https://github.com/acesso-io/acessobio-ios’` no podfile do projeto IOS em seguida execute comando `pod install`

3 - Adicione `#import <AcessoBioManager.h>` no arquivo Runner-Bridging-Header.h

4 - No arquivo acessobio_plugin-umbrella.h adicione `@import AcessoBio;` localizado no diretorio: `YOUR_PROJECT/example/ios/Pods/Target Support Files/acessobio_plugin/acessobio_plugin-umbrella.h`

5 - no Target Menbership defina o arquivo `centerModelCrop` como publico.