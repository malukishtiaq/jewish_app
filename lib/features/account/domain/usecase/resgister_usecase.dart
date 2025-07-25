import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/resgister_param.dart';
import '../entity/member_info_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class ResgisterUsecase extends UseCase<MemberInfoEntity, ResgisterParam> {
  final IAccountRepository repository;

  ResgisterUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberInfoEntity>> call(ResgisterParam param) async {
    return await repository.resgister(param);
  }
}
