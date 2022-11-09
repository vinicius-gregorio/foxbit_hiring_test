import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';

import '../usecases/get_quotation_usecase_copy.dart';

abstract class IQuotationRepository {
  Future<List<AssetEntity>> getQuotations(GetQuotationUsecaseParamsz params);
}
