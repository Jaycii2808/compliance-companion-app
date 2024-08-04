import 'package:json_annotation/json_annotation.dart';

part 'example_response.g.dart';

@JsonSerializable()
class ExampleResponse {
  final String? example1;
  final String? example2;

  const ExampleResponse({this.example1, this.example2});

  factory ExampleResponse.fromJson(Map<String, dynamic> json) {
    return _$ExampleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExampleResponseToJson(this);
}
