import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/get_otp_param.dart';
import '../entity/send_otp_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class GetOtpUsecase extends UseCase<SendOtpEntity, GetOtpParam> {
  final IAccountRepository repository;

  GetOtpUsecase(this.repository);

  @override
  Future<Result<AppErrors, SendOtpEntity>> call(GetOtpParam param) async {
    return await repository.getOtp(param);
  }
}

