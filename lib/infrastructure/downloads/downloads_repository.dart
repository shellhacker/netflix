import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_point.dart';
import 'package:netflix/domain/dawonloads/i_downloads_repo.dart';
import '../../domain/core/failures/main_failure.dart';
import '../../domain/dawonloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response respones =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (respones.statusCode == 200 || respones.statusCode == 201) {
        final downloadsList = (respones.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        print(downloadsList);

        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
