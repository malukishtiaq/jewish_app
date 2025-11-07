import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/dashboard_param.dart';
import '../entity/daily_chart_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class SaveUpdatedDateUsecase
    extends UseCase<List<DailyChartEntity>, DashboardParam> {
  final IAccountRepository repository;

  SaveUpdatedDateUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<DailyChartEntity>>> call(
      DashboardParam param) async {
    return await repository.saveUpdatedDate(param);
  }
}

