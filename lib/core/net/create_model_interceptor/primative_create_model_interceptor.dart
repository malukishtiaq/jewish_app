import 'dart:convert';

import 'create_model.interceptor.dart';

class PrimativeCreateModelInterceptor extends CreateModelInterceptor {
  const PrimativeCreateModelInterceptor();
  @override
  T getModel<T>(dynamic Function(dynamic p1) modelCreator, dynamic json) {
    return modelCreator(jsonDecode(jsonEncode(json)));
  }
}
