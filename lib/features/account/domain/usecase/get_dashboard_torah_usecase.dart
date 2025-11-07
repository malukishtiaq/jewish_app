import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/dashboard_param.dart';
import '../entity/torah_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetDashboardTorahUsecase extends UseCase<List<TorahEntity>, DashboardParam> {
  final IAccountRepository repository;

  GetDashboardTorahUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<TorahEntity>>> call(DashboardParam param) async {
    return await repository.getDashboardTorah(param);
  }
}

