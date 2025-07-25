import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/login_param.dart';
import '../repository/iaccount_repository.dart';

@singleton
class LoginUsecase extends UseCase<EmptyResponse, LoginParam> {
  final IAccountRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(LoginParam param) async {
    return await repository.login(param);
  }
}
