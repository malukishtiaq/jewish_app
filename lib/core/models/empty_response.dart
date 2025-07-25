import '../../core/entities/base_entity.dart';
import '../common/type_validators.dart';
import 'base_model.dart';

class EmptyResponse extends BaseModel {
  final bool? succeed;
  final String? message;
  final String? status;

  EmptyResponse({this.succeed, this.message, this.status});

  factory EmptyResponse.fromMap(dynamic json) {
    return json is Map
        ? EmptyResponse(
            succeed: boolV(json["succeed"]),
            message: stringV(json["message"] ?? ""),
            status: stringV(json["status"] ?? ""),
          )
        : EmptyResponse();
  }

  Map<String, dynamic> toMap() => {
        "succeed": succeed,
        "message": message,
        "status": status,
      };

  @override
  BaseEntity toEntity() {
    throw UnimplementedError();
  }
}
