import 'package:jewish_app/core/common/extensions/string_extensions.dart';

import '../../../../../core/params/base_params.dart';

class LoginParam extends BaseParams {
  final String? email;

  LoginParam({this.email});

  @override
  Map<String, dynamic> toMap() => {if (email.isNotEmptyNorNull) "Email": email};
}
