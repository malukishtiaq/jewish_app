import 'package:injectable/injectable.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/results/result.dart';
import 'package:jewish_app/core/usecases/usecase.dart';
import 'package:jewish_app/features/account/data/request/param/dashboard_param.dart';
import 'package:jewish_app/features/account/domain/entity/partial_stats_response_entity.dart';
import 'package:jewish_app/features/home/domain/repository/i_home_repository.dart';

@singleton
class GetHomePartialStatsUsecase
    extends UseCase<PartialStatsResponseEntity, DashboardParam> {
  final IHomeRepository repository;

  GetHomePartialStatsUsecase(this.repository);

  @override
  Future<Result<AppErrors, PartialStatsResponseEntity>> call(
      DashboardParam param) async {
    return await repository.getDashboardPartialStats(param);
  }
}

