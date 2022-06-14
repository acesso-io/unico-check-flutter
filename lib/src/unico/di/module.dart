import 'package:unico_check/src/unico/adapter/repository/channel.repository.default.dart';
import 'package:unico_check/src/unico/adapter/repository/plugin/channel.unico.dart';
import 'package:unico_check/src/unico/adapter/repository/processors/camera.result.processor.mapper.dart';
import 'package:unico_check/src/unico/di/di.dart';
import 'package:unico_check/src/unico/domain/entities/open.camera.request.dart';
import 'package:unico_check/src/unico/domain/interface/channel.repository.dart';
import 'package:unico_check/src/unico/domain/mapper/unico_error_mapper.dart';
import 'package:unico_check/src/unico/domain/usecase/open.camera.usecase.dart';
import 'package:unico_check/src/unico/domain/usecase/unico.callback.usecase.dart';
import 'package:unico_check/src/unico/plugins/channel/channel.unico.default.dart';

class Module {
  static initDependencies() {
    _repositoryDependecies(Di.I);
    _domainDependecies(Di.I);
  }

  static tearDownDependencies() {
    Di.I.clearFactories();
  }

  static _domainDependecies(Di helper) {
    helper.registerFactory<OpenCameraRequest>(
      () => OpenCameraRequest(),
    );
    helper.registerFactory<UnicoErrorMapper>(
      () => UnicoErrorMapper(),
    );
    helper.registerFactory<OpenCameraUseCase>(
      () => OpenCameraUseCase(Di.I.get()),
    );
    helper.registerFactory<UnicoCallBackUseCase>(
      () => UnicoCallBackUseCase(Di.I.get()),
    );
  }

  static _repositoryDependecies(Di helper) {
    helper.registerFactory<CameraResultProcessorMapper>(
      () => CameraResultProcessorMapper(),
    );
    helper.registerFactory<ChannelUnico>(
      () => ChannelUnicoDefault(),
    );
    helper.registerFactory<ChannelRepository>(
      () => ChannelRepositoryDefault(Di.I.get(), Di.I.get()),
    );
  }
}
