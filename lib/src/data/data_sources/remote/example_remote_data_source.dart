
import 'package:compliance_companion/src/core/base_response.dart';
import 'package:compliance_companion/src/data/model/example_response.dart';
import 'package:compliance_companion/src/data/service/example_service.dart';
import 'package:dartz/dartz.dart';

abstract class ExampleRemoteDataSource {
  Future<Either<Exception, BaseResponse<ExampleResponse>>> getExample();
}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  final ExampleService exampleService;

  ExampleRemoteDataSourceImpl({required this.exampleService});

  @override
  Future<Either<Exception, BaseResponse<ExampleResponse>>> getExample() async {
    try {
      final response = await exampleService.getExample1();
      return Right(response.data);
    } on Exception catch (error) {
      return Left(error);
    }
  }
}
