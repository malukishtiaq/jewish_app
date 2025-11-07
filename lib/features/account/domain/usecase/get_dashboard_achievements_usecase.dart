import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/dashboard_param.dart';
import '../entity/achievements_response_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetDashboardAchievementsUsecase extends UseCase<AchievementsResponseEntity, DashboardParam> {
  final IAccountRepository repository;

  GetDashboardAchievementsUsecase(this.repository);

  @override
  Future<Result<AppErrors, AchievementsResponseEntity>> call(DashboardParam param) async {
    return await repository.getDashboardAchievements(param);
  }
}

