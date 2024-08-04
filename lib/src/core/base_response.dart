import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'base_response.g.dart';

BaseResponse<T> deserializeBaseResponse<T>(List params) =>
    BaseResponse.fromJson(params.firstOrNull, params.lastOrNull);
Map<String, dynamic> serializeBaseResponse<T>(List params) =>
    params.firstOrNull?.toJson(params.lastOrNull);

@JsonSerializable(
  genericArgumentFactories: true,
)
class BaseResponse<T> {
  final T? data;
  final List<Message>? messages;
  BaseResponse(this.data, this.messages);

  bool isFirstSuccess() => messages?.firstOrNull?.isSuccess() == true;
  bool isAllSuccess() => messages?.every((e) => e.isSuccess()) == true;
  bool isAnyError() => messages?.any((m) => !m.isSuccess()) == true;
  bool isErrorCode(String code) =>
      messages?.firstWhereOrNull((e) => e.code == code) != null;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

@JsonSerializable()
class Message {
  final String? code;
  final String? message;

  bool isSuccess() => code == 'SUCCESS';

  Message(this.code, this.message);

  factory Message.empty() => Message('', '');

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
