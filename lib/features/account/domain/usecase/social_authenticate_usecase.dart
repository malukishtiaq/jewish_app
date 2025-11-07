import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/social_authenticate_param.dart';
import '../entity/member_info_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class SocialAuthenticateUsecase
    extends UseCase<MemberInfoEntity, SocialAuthenticateParam> {
  final IAccountRepository repository;

  SocialAuthenticateUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberInfoEntity>> call(
      SocialAuthenticateParam param) async {
    return await repository.socialAuthenticate(param);
  }
}

