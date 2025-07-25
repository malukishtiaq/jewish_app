import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/verify_otp_param.dart';
import '../entity/validate_otp_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class VerifyOtpUsecase extends UseCase<ValidateOtpEntity, VerifyOtpParam> {
  final IAccountRepository repository;

  VerifyOtpUsecase(this.repository);

  @override
  Future<Result<AppErrors, ValidateOtpEntity>> call(
      VerifyOtpParam param) async {
    return await repository.verifyOtp(param);
  }
}
