import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_subscribe_level_usecase.dart';

abstract class ISubscribeLevelRepository {
  Future<SubscribeLevelEntity> getSubscribeLevel(
      FoxbitWebSocket ws, GetSubscribeLevelUsecaseParams params);
}
