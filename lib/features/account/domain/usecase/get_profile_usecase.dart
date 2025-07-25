import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/member_get_param.dart';
import '../entity/member_info_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetProfileUsecase extends UseCase<MemberInfoEntity, MemberGetParam> {
  final IAccountRepository repository;

  GetProfileUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberInfoEntity>> call(MemberGetParam param) async {
    return await repository.getProfile(param);
  }
}

@singleton
class RetrieveProfileUsecase extends UseCase<MemberInfoEntity, MemberGetParam> {
  final IAccountRepository repository;

  RetrieveProfileUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberInfoEntity>> call(MemberGetParam param) async {
    return await repository.retrieveProfileApi(param);
  }
}
