import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/results/result.dart';
import 'package:jewish_app/core/usecases/usecase.dart';
import 'package:jewish_app/features/account/data/request/param/validate_otp_param.dart';
import 'package:jewish_app/features/account/domain/entity/validate_otp_login_entity.dart';
import 'package:jewish_app/features/account/domain/repository/iaccount_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class VerifyOtpOnLoginUsecase
    extends UseCase<ValidateOtpLoginEntity, ValidateOtpParam> {
  final IAccountRepository repository;

  VerifyOtpOnLoginUsecase(this.repository);

  @override
  Future<Result<AppErrors, ValidateOtpLoginEntity>> call(
    ValidateOtpParam param,
  ) async {
    return await repository.verifyOtpOnLogin(param);
  }
}
