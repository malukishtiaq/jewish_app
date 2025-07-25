import 'package:injectable/injectable.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/results/result.dart';
import 'package:jewish_app/core/usecases/usecase.dart';
import 'package:jewish_app/features/account/data/request/param/device_info_param.dart';
import 'package:jewish_app/features/account/domain/entity/member_device_info_entity.dart';
import 'package:jewish_app/features/account/domain/repository/iaccount_repository.dart';

@singleton
class SaveDevicesUsecase
    extends UseCase<MemberDeviceInfoEntity, DeviceInfoParam> {
  final IAccountRepository repository;

  SaveDevicesUsecase(this.repository);

  @override
  Future<Result<AppErrors, MemberDeviceInfoEntity>> call(
    DeviceInfoParam param,
  ) async {
    return await repository.saveDevices(param);
  }
}
