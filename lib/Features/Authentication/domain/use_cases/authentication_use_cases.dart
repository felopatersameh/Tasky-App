import 'package:dartz/dartz.dart';import '../../../../Core/Utils/Errors/failure.dart';import '../../data/models/login_model.dart';import '../../data/models/sing_up_model.dart';import '../../data/repositories/authentication_repo.dart';class LoginUseCase {  final AuthenticationRepo repository;  LoginUseCase(this.repository);  Future<Either<Failure, LoginModel>> execute({    required String phone,    required String password,  }) async {    return await repository.fetchLogin(phone: phone, password: password);  }}class SignUpUseCase {  final AuthenticationRepo authenticationRepo;  SignUpUseCase(this.authenticationRepo);  Future<Either<Failure, SingUpModel>> execute({    required String name,    required num experienceYears,    required String address,    required String level,    required String phone,    required String password,  }) {    return authenticationRepo.fetchRegister(      name: name,      experienceYears: experienceYears,      address: address,      level: level,      phone: phone,      password: password,    );  }}