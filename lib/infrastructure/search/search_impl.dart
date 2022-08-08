import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_point.dart';
import 'package:netflix/domain/dawonloads/models/downloads.dart';
import 'package:netflix/domain/search/model/search_resp.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/search/model/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService{
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies({required String movieQuery})async {
 
    try {
      final Response respones =
          await Dio(BaseOptions()).get(ApiEndPoints.search,
          queryParameters: {'query':movieQuery},);
      if (respones.statusCode == 200 || respones.statusCode == 201) {
        final result= SearchResp.fromJson(respones.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
  
}