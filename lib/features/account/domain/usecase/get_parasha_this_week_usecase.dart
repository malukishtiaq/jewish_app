import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/dashboard_param.dart';
import '../entity/this_week_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetParashaThisWeekUsecase
    extends UseCase<List<ThisWeekEntity>, DashboardParam> {
  final IAccountRepository repository;

  GetParashaThisWeekUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<ThisWeekEntity>>> call(
      DashboardParam param) async {
    return await repository.getParashaThisWeek(param);
  }
}
