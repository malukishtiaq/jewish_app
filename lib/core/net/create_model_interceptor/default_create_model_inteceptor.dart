import 'dart:convert';

import 'package:jewish_app/core/net/create_model_interceptor/create_model.interceptor.dart';

class DefaultCreateModelInterceptor extends CreateModelInterceptor {
  const DefaultCreateModelInterceptor();
  @override
  T getModel<T>(dynamic Function(dynamic) modelCreator, dynamic json) {
    /// Encode json then Decode it to ensure json is Map
    return modelCreator(jsonDecode(jsonEncode(json['data'])));
  }
}
