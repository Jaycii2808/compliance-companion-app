
import 'package:compliance_companion/src/core/base_response.dart';
import 'package:compliance_companion/src/data/model/example_request.dart';
import 'package:compliance_companion/src/data/model/example_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'example_service.g.dart';

@RestApi()
abstract class ExampleService {
  factory ExampleService(Dio dio, {String baseUrl}) = _ExampleService;

  @GET('example-api')
  Future<HttpResponse<BaseResponse<ExampleResponse>>> getExample1();

  @GET('example-api/{param1}')
  Future<HttpResponse<BaseResponse<ExampleResponse>>> getExample2(
    @Path('param1') String param1,
    @Query('query1') String query1,
  );

  @POST('example-api')
  Future<HttpResponse<BaseResponse<ExampleResponse>>> postExample1(
    @Body() ExampleRequest request,
  );

  @POST('example-api/{path}')
  Future<HttpResponse<BaseResponse<ExampleResponse>>> postExample2(
    @Path('path') String path,
    @Body() ExampleRequest exampleRequest,
  );

  @POST('example-api/{path}')
  Future<HttpResponse<BaseResponse<ExampleResponse>>> putExample1(
    @Path('path') String path,
    @Body() ExampleRequest exampleRequest,
  );
}
