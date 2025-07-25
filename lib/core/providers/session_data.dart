import 'package:jewish_app/features/account/domain/entity/member_info_entity.dart';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class SessionData extends ChangeNotifier {
  MemberInfoEntity? _user;
  int? _memberID;
  int? get memberID => _memberID;
  set setMemberId(int? value) {
    _memberID = value;
    notifyListeners();
  }

  MemberInfoEntity? get user => _user;
  set user(MemberInfoEntity? value) {
    _user = value;
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
