import 'package:dartz/dartz.dart';
import 'package:goldy/core/networking/api_const.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/gold/data/model/gold_model.dart';

class GoldRepo {
 Future<Either<String,GoldModel>> getGold() async {
  try {
      final response = await DioHelper.getData(
        endPoint: ApiConstants.goldEndPoint,
      );

      return Right(GoldModel.fromJson(response.data));
  } catch (e) {
      return Left(e.toString());}
  }
}
