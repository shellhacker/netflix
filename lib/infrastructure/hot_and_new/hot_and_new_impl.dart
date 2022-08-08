import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

class HotAndNewImplementation implements HotAndNewService{
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMoiveData()async {
    // TODO: implement getHotAndNewMoiveData
    throw UnimplementedError();
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async{
    // TODO: implement getHotAndNewTvData
    throw UnimplementedError();
  }
  
}