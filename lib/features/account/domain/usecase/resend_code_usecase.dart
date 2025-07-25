import 'package:jewish_app/features/account/data/request/param/resend_code_param.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/send_otp_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class ResendCodeUsecase extends UseCase<SendOtpEntity, ResendCodeParam> {
  final IAccountRepository repository;

  ResendCodeUsecase(this.repository);

  @override
  Future<Result<AppErrors, SendOtpEntity>> call(ResendCodeParam param) async {
    return await repository.resendCode(param);
  }
}
