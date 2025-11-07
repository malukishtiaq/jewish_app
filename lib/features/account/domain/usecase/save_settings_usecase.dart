import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/save_settings_param.dart';
import '../entity/member_info_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class SaveSettingsUsecase extends UseCase<MemberInfoEntity, SaveSettingsParam> {
  final IAccountRepository repository;

  SaveSettingsUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberInfoEntity>> call(SaveSettingsParam param) async {
    return await repository.saveSettings(param);
  }
}

