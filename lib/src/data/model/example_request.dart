import 'package:json_annotation/json_annotation.dart';

part 'example_request.g.dart';

@JsonSerializable()
class ExampleRequest {
  final String rq1;
  final String rq2;
  final String rq3;

  ExampleRequest(this.rq1, this.rq2, this.rq3);

  factory ExampleRequest.fromJson(Map<String, dynamic> json) =>
      _$ExampleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleRequestToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleRequest &&
          runtimeType == other.runtimeType &&
          rq1 == other.rq1 &&
          rq2 == other.rq2 &&
          rq3 == other.rq3;

  @override
  int get hashCode => rq1.hashCode ^ rq2.hashCode ^ rq3.hashCode;
}
