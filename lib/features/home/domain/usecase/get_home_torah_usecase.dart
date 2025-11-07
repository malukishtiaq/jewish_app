import 'package:injectable/injectable.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/results/result.dart';
import 'package:jewish_app/core/usecases/usecase.dart';
import 'package:jewish_app/features/account/data/request/param/dashboard_param.dart';
import 'package:jewish_app/features/account/domain/entity/torah_entity.dart';
import 'package:jewish_app/features/home/domain/repository/i_home_repository.dart';

@singleton
class GetHomeTorahUsecase extends UseCase<List<TorahEntity>, DashboardParam> {
  final IHomeRepository repository;

  GetHomeTorahUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<TorahEntity>>> call(
      DashboardParam param) async {
    return await repository.getDashboardTorah(param);
  }
}

