
# Unico Check

Esta biblioteca visa implementar a tecnologia Unico para prova de vida sob a plataforma Flutter.

## Getting Started

## Android 

Pré-requisito minSdkVersion : 21

## IOS

Pré-requisito versão 11 ou superior.

Caso ainda não possua as permissões para o uso de câmera em seu projeto

`<key>NSCameraUsageDescription</key>`
`<string>Camera usage description</string>`

## Versão do ambiente
Siga o passo a passo da documentação do [flutter](https://docs.flutter.dev/get-started/install) para preparar seu ambiente.

- **Flutter**
  | Environment              | Version |
  | ------------------------ | ------- |
  | Flutter (channel Stable) | 2.12.0  |
  | Dart                     | 2.17.0  |
  
## 1. Clonando o repositório
- Se você não tem configurado na sua máquina uma chave SSH, é necessário criar uma seguindo o [GitHub's directions](https://help.github.com/articles/generating-ssh-keys/).
- Clone o repositório
  ```shell
  git clone git@github.com:acesso-io/unico-check-flutter.git
  cd unico-app
  ```
  
## 2. Rodando os testes unitários
- Basta entrar na raiz do projeto e rodar.
 ```shell
  flutter test
  ```
  
## 3. Rodando os testes unitários com cobertura
- Em nossos testes, não estamos cobrindo a camada de entidades, então podemos ignorar este arquivos. Basta entrar na raiz do projeto e rodar.
 ```shell
  make unit-tests-coverage
  ```
- Após isso, é gerado um arquivo index em coverage/hmtl/index.html, abra este aquivo em seu navegador de preferencia.
  
## 4. Rodando análise estática de código.
- Com bases na Official Dart lint rules [ https://pub.dev/packages/lints ], temos nossa análise estática de código. Basta entrar na raiz do projeto e rodar.
 ```shell
  flutter analyze
  ```
