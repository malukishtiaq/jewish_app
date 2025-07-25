import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/validate_email_verification_param.dart';
import '../entity/validate_email_verification_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class ValidateEmailVerificationUsecase extends UseCase<
    ValidateEmailVerificationEntity, ValidateEmailVerificationParam> {
  final IAccountRepository repository;

  ValidateEmailVerificationUsecase(this.repository);

  @override
  Future<Result<AppErrors, ValidateEmailVerificationEntity>> call(
      ValidateEmailVerificationParam param) async {
    return await repository.validateEmailVerification(param);
  }
}
