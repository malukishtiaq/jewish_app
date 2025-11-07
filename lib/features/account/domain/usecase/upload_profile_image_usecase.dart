import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/upload_profile_image_param.dart';
import '../entity/profile_image_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class UploadProfileImageUsecase
    extends UseCase<ProfileImageEntity, UploadProfileImageParam> {
  final IAccountRepository repository;

  UploadProfileImageUsecase(this.repository);

  @override
  Future<Result<AppErrors, ProfileImageEntity>> call(
      UploadProfileImageParam param) async {
    return await repository.uploadProfileImage(param);
  }
}

