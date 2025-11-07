import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/dashboard_param.dart';
import '../entity/current_book_stats_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetDashboardCurrentBookStatsUsecase extends UseCase<List<CurrentBookStatsEntity>, DashboardParam> {
  final IAccountRepository repository;

  GetDashboardCurrentBookStatsUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<CurrentBookStatsEntity>>> call(DashboardParam param) async {
    return await repository.getDashboardCurrentBookStats(param);
  }
}

