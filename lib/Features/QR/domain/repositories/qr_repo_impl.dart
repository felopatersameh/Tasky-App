import 'package:dartz/dartz.dart';import 'package:dio/dio.dart';import 'package:tasky/Core/Network/Remote/endpoints.dart';import 'package:tasky/Core/Utils/Errors/failure.dart';import 'package:tasky/Features/Home/data/models/task_model.dart';import 'package:tasky/Features/QR/data/repositories/qr_repo.dart';import '../../../../Core/Network/Local/local_string.dart';import '../../../../Core/Network/Remote/dio.dart';class QrRepoImpl implements QrRepo {  @override  Future<Either<Failure, TaskModel>> getOne({required String id}) async {    try {      var data = await DioHelper.getData(        path: '${AppEndPoint.getOneTask}$id',        token: GetLocalValue.token,      );      return right(TaskModel.fromJson(data.data));    } catch (e) {      if (e is DioException) {        {          return left(ServerFailure.fromDioError(e));        }      } else {        return left(ServerFailure.fromResponse(e.hashCode, e));      }    }  }}