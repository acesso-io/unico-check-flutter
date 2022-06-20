import 'package:flutter/services.dart';
import 'package:unico_check/src/unico/adapter/api/mapper/open.check.camera.factory.dart';
import 'package:unico_check/src/unico/adapter/repository/channel.repository.default.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/di/injection.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/domain/mapper/unico.error.factory.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';
import 'package:unico_check/src/unico/plugins/channel/channel.unico.default.dart';

class Module {
  static initDependencies() {
    final helper = Injection.I;

    _repositoryDependecies(helper);
    _domainDependecies(helper);
  }

  static tearDownDependencies() {
    Injection.I.clearFactories();
  }

  static _domainDependecies(Injection helper) {
    helper.factory<OpenCameraRequest>(
      () => OpenCameraRequest(),
    );
    helper.factory<UnicoErrorFactory>(
      () => UnicoErrorFactory(),
    );
    helper.factory<OpenCameraUseCase>(
      () => OpenCameraUseCase(Injection.I.get()),
    );
    helper.factory<UnicoCallBackUseCase>(
      () => UnicoCallBackUseCase(Injection.I.get()),
    );
  }

  static _repositoryDependecies(Injection helper) {
    helper.factory<CameraResultProcessorMapper>(
      () => CameraResultProcessorMapper(),
    );
    helper.factory<OpenCheckCameraFactory>(
      () => OpenCheckCameraFactory(),
    );
    helper.factory<ChannelUnico>(
      () => ChannelUnicoDefault(_channel),
    );
    helper.factory<ChannelRepository>(
      () => ChannelRepositoryDefault(Injection.I.get(), Injection.I.get()),
    );
  }

  static const _channel = MethodChannel('unico_channel');
}
