import '../../../../../core/params/base_params.dart';

class SavePasswordParam extends BaseParams {
  final int id;
  final String password;

  SavePasswordParam({
    required this.id,
    required this.password,
  });

  @override
  Map<String, dynamic> toMap() => {
        "Id": id,
        "Password": password,
      };
}

