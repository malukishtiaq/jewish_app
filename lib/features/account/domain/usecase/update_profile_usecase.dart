import 'package:jewish_app/features/account/data/request/param/update_profile_param.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/member_info_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class UpdateProfileUsecase
    extends UseCase<MemberInfoEntity, UpdateProfileParam> {
  final IAccountRepository repository;

  UpdateProfileUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberInfoEntity>> call(
    UpdateProfileParam param,
  ) async {
    return await repository.updateProfile(param);
  }
}
