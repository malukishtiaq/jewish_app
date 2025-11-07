import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/save_password_param.dart';
import '../entity/member_info_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class SavePasswordUsecase extends UseCase<MemberInfoEntity, SavePasswordParam> {
  final IAccountRepository repository;

  SavePasswordUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberInfoEntity>> call(SavePasswordParam param) async {
    return await repository.savePassword(param);
  }
}

