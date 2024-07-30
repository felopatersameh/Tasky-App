import 'package:dartz/dartz.dart';import '../../../../Core/Utils/Errors/failure.dart';import '../models/task_model.dart';abstract class HomeRepo {  Future<Either<Failure, List<TaskModel>>> getAllDataTasks();  Future<Either<Failure, bool>> logout();  Future<Either<Failure, bool>> removeTask({required String id});  Future<Either<Failure, String>> refreshToken();}