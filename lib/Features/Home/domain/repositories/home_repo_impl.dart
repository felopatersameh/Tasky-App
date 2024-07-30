import 'package:dartz/dartz.dart';import 'package:dio/dio.dart';import 'package:tasky/Core/Network/Local/local_string.dart';import 'package:tasky/Core/Utils/Errors/failure.dart';import 'package:tasky/Features/Home/data/models/task_model.dart';import 'package:tasky/Features/Home/data/repositories/home_repo.dart';import '../../../../Core/Network/Local/cash_helper.dart';import '../../../../Core/Network/Remote/dio.dart';import '../../../../Core/Network/Remote/endpoints.dart';class HomeRepoImpl implements HomeRepo {  @override  Future<Either<Failure, List<TaskModel>>> getAllDataTasks() async {    try {      final token = GetLocalValue.token;      var data = await DioHelper.getData(path: AppEndPoint.list, token: token);      final List<dynamic> jsonData = data.data;      final List<TaskModel> tasks =          jsonData.map((json) => TaskModel.fromJson(json)).toList();      return right(tasks);    } catch (e) {      if (e is DioException) {        {          return left(ServerFailure.fromDioError(e));        }      } else {        return left(ServerFailure.fromResponse(e.hashCode, e));      }    }  }  @override  Future<Either<Failure, bool>> logout() async {    try {      var data = await DioHelper.postData(          path: AppEndPoint.logout,          token: GetLocalValue.token,          data: {'token': GetLocalValue.refreshToken});      if (data.data['success'] == true) {        CashHelper.removeData(          key: LocalString.token,        );        CashHelper.removeData(          key: LocalString.refreshToken,        );      }      return right(true);    } catch (e) {      if (e is DioException) {        return left(ServerFailure.fromDioError(e));      } else {        return left(ServerFailure.fromResponse(e.hashCode, e));      }    }  }  @override  Future<Either<Failure, bool>> removeTask({required String id}) async {    try {      await DioHelper.deleteData(          path: '${AppEndPoint.delete}/$id', token: GetLocalValue.token);      return right(true);    } catch (e) {      if (e is DioException) {        {          return left(ServerFailure.fromDioError(e));        }      } else {        return left(ServerFailure.fromResponse(e.hashCode, e));      }    }  }  @override  Future<Either<Failure, String>> refreshToken() async {    try {      CashHelper.removeData(        key: LocalString.token,      );      var data = await DioHelper.getData(        path: AppEndPoint.refresh,        queryParameters: {'token': LocalString.refreshToken},      );      final newTokens = data.data['access_token'];      CashHelper.saveData(key: LocalString.token, value: newTokens);      print('access_token: $newTokens}');      return right(newTokens);    } catch (e) {      if (e is DioException) {        return left(ServerFailure.fromDioError(e));      } else {        return left(ServerFailure.fromResponse(e.hashCode, e));      }    }  }}