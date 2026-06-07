import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goldy/core/error/api_failure.dart';
import 'package:goldy/core/networking/api_const.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/sliver/data/model/sliver_model.dart';

class SliverRepo {
  Future<Either<String, SliverModel>> getSliver() async {
    try {
      final response = await DioHelper.getData(
        endPoint: ApiConstants.silverEndPoint,
      );
      return Right(SliverModel.fromJson(response.data));
    } on DioException catch (e) {
      final failure = ApiFailure.fromDioException(e);
      return Left(failure.message);
    } catch (e) {
      return const Left("An unexpected error occurred.");
    }
  }
}
