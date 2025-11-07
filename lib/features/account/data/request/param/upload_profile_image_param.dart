import '../../../../../core/params/base_params.dart';

class UploadProfileImageParam extends BaseParams {
  final int id;
  final String filePath;

  UploadProfileImageParam({required this.id, required this.filePath});

  @override
  Map<String, dynamic> toMap() => {
        'Id': id,
      };
}

