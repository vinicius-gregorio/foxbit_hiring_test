import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_quotation_usecase.dart';

abstract class IQuotationRepository {
  Future<List<AssetEntity>> getQuotations(GetQuotationUsecaseParams params);
}
