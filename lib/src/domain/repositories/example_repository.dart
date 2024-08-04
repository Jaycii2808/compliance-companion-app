
import 'package:compliance_companion/src/core/base_response.dart';
import 'package:compliance_companion/src/data/model/example_response.dart';
import 'package:dartz/dartz.dart';

abstract class ExampleRepository {
  Future<Either<Exception, BaseResponse<ExampleResponse>>> getExample();
}
