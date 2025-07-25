import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/send_email_verification_param.dart';
import '../entity/send_email_verification_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class SendEmailVerificationUsecase
    extends UseCase<SendEmailVerificationEntity, SendEmailVerificationParam> {
  final IAccountRepository repository;

  SendEmailVerificationUsecase(this.repository);

  @override
  Future<Result<AppErrors, SendEmailVerificationEntity>> call(
      SendEmailVerificationParam param) async {
    return await repository.sendEmailVerification(param);
  }
}
