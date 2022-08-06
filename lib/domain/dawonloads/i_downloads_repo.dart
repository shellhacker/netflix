import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/dawonloads/models/downloads.dart';

abstract class IDownloadsRepo{
  Future<Either<MainFailure,List<Downloads>>>getDownloadsImages();

}