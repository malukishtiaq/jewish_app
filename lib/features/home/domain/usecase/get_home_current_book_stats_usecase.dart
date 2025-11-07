import 'package:injectable/injectable.dart';
import 'package:jewish_app/core/results/result.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/usecases/usecase.dart';
import 'package:jewish_app/features/account/data/request/param/dashboard_param.dart';
import 'package:jewish_app/features/account/domain/entity/current_book_stats_entity.dart';
import 'package:jewish_app/features/home/domain/repository/i_home_repository.dart';

@singleton
class GetHomeCurrentBookStatsUsecase
    extends UseCase<List<CurrentBookStatsEntity>, DashboardParam> {
  final IHomeRepository repository;

  GetHomeCurrentBookStatsUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<CurrentBookStatsEntity>>> call(
      DashboardParam param) async {
    return await repository.getDashboardCurrentBookStats(param);
  }
}

