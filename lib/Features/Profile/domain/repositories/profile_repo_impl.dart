import 'package:dartz/dartz.dart';import 'package:dio/dio.dart';import 'package:tasky/Core/Utils/Errors/failure.dart';import 'package:tasky/Features/Profile/data/models/profile_model.dart';import '../../../../Core/Network/Local/local_string.dart';import '../../../../Core/Network/Remote/dio.dart';import '../../../../Core/Network/Remote/endpoints.dart';import '../../data/repositories/profile_reo.dart';class ProfileRepoImpl implements ProfileReo {  @override  Future<Either<Failure, ProfileModel>> fetchLogin() async {    try {      var data = await DioHelper.getData(          path: AppEndPoint.profile, token: GetLocalValue.token);      return right(ProfileModel.fromJson(data.data));    } catch (e) {      if (e is DioException) {        if (e.response?.statusCode == 401) {          return left(ServerFailure.fromDioError(e));        } else {          return left(ServerFailure.fromDioError(e));        }      } else {        return left(ServerFailure.fromResponse(e.hashCode, e));      }    }  }}