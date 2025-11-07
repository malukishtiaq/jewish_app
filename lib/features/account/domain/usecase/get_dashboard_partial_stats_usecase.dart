import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/dashboard_param.dart';
import '../entity/partial_stats_response_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetDashboardPartialStatsUsecase extends UseCase<PartialStatsResponseEntity, DashboardParam> {
  final IAccountRepository repository;

  GetDashboardPartialStatsUsecase(this.repository);

  @override
  Future<Result<AppErrors, PartialStatsResponseEntity>> call(DashboardParam param) async {
    return await repository.getDashboardPartialStats(param);
  }
}

