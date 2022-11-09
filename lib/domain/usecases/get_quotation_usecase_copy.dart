import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';

import '../repositories/quotation_repository_copy.dart';

class GetQuotationUsecase extends CompletableUseCase<GetQuotationUsecaseParamsz> {
  GetQuotationUsecase(
    this._repository,
  );

  final IQuotationRepository _repository;

  @override
  Future<Stream<List<AssetEntity>>> buildUseCaseStream(GetQuotationUsecaseParamsz params) async {
    final StreamController<List<AssetEntity>> controller = StreamController<List<AssetEntity>>();

    try {
      final List<AssetEntity> assets = await _repository.getQuotations(params);
      controller.add(assets);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}

class GetQuotationUsecaseParamsz {
  final String instrumentId;
  final FoxbitWebSocket ws;

  GetQuotationUsecaseParamsz(this.instrumentId, this.ws);
}
