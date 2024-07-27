import 'package:dartz/dartz.dart';import 'package:dio/dio.dart';import '../../data/models/SingUpModel.dart';import '../../data/repositories/repo_sing_up.dart';import '../../../../Core/Network/Remote/dio.dart';import '../../../../Core/Network/Remote/endpoints.dart';import '../../../../Core/Utils/Errors/failure.dart';class SingUpRepoImpl implements SingUpRepo {  @override  Future<Either<Failure, SingUpModel>> fetchRegister({    required String name,    required num experienceYears,    required String address,    required String level,    required String phone,    required String password,  }) async {    try {      final singUpModel = SingUpModel(        displayName: name,        password: password,        phone: phone,        level: level,        experienceYears: experienceYears,        address: address,      );      var data = await DioHelper.postData(          path: AppEndPoint.register, data: singUpModel.toJson());      if (data.statusCode != null && data.statusCode! < 300) {        // Example: Save token if needed // CashHelper.saveData(key: 'Token', value: response.data["token"]);      }      return right(SingUpModel.fromJson(data.data));    } catch (e) {      if (e is DioException) {        return left(ServerFailure.fromDioError(e));      } else {        return left(ServerFailure.fromResponse(e.hashCode, e));      }    }  }}