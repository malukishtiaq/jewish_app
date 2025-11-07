import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/dashboard_param.dart';
import '../entity/book_stats_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetDashboardBookStatsUsecase extends UseCase<List<BookStatsEntity>, DashboardParam> {
  final IAccountRepository repository;

  GetDashboardBookStatsUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<BookStatsEntity>>> call(DashboardParam param) async {
    return await repository.getDashboardBookStats(param);
  }
}

