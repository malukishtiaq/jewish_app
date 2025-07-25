// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jewish_app/core/common/extensions/string_extensions.dart';

import '../../../../../core/params/base_params.dart';

class DeleteAccountParam extends BaseParams {
  final int memberId;
  final String? deleteType;
  DeleteAccountParam({required this.memberId, this.deleteType});

  @override
  Map<String, dynamic> toMap() => {
    "MembersId": memberId,
    if (deleteType.isNotEmptyNorNull) "DeleteType": deleteType,
  };
}
