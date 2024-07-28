import 'package:intl/intl.dart';
import 'package:tasky/Core/Resources/string.dart';
import '../../Features/Login/presentation/manager/log_in_cubit.dart';
import '../../Features/SignUp/presentation/manager/sing_up_cubit.dart';
import '../Network/Local/cachehelper.dart';
import '../Network/Remote/dio.dart';
import '../Network/Remote/endpoints.dart';

Future<void> validateLogIn(context,
    {var key, required String password, required String phone}) async {
  if (key.currentState?.validate() == true) {
    return LogInCubit.get(context).login(password: password, phone: phone);
  }
}

Future<void> validateSingIn(
  context, {
  var key,
  required String name,
  required num experienceYears,
  required String address,
  required String level,
  required String phone,
  required String password,
}) async {
  if (key.currentState?.validate() == true) {
    return SingUpCubit.get(context).singUp(
        password: password,
        phone: phone,
        name: name,
        experienceYears: experienceYears,
        address: address,
        level: level);
  }
}

//************************************************ ///validate
String? defaultValidate({required String text, required String validate}) {
  if (text.isEmpty) {
    return validate;
  }
  return null;
}

//************************************************ ///validate Email
String? validateEmail({required String email}) {
  const String pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
  final RegExp regex = RegExp(pattern);

  //------------------------
  if (email.isEmpty) {
    return AppStrings.emailValidate;
  } else if (!regex.hasMatch(email)) {
    return 'The email address is badly formatted.';
  }
  // else if (validateCheck(email, "email").toString().isNotEmpty && singIn) {
  //   return 'The email address has already been registered.';
  // } else if (validateCheck(email, "email").toString().isEmpty && !singIn) {
  //   return 'The email address has not registered.';
  // }
  return null;
}

//************************************************ ///validate Password
String? validatePassword(bool singIn, {required String password}) {
  if (password.isEmpty) {
    return AppStrings.passwordValidate;
  }
  // Password must contain at least 8 characters
  else if (singIn) {
    if (password.length < 8) {
      return 'The password must be at least 8 characters long.';
    }
    // Password must contain at least one uppercase letter
    else if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'The password must contain at least one uppercase letter.';
    }
    // Password must contain at least one lowercase letter
    else if (!password.contains(RegExp(r'[a-z]'))) {
      return 'The password must contain at least one lowercase letter.';
    }
    // Password must contain at least one digit
    else if (!password.contains(RegExp(r'[0-9]'))) {
      return 'The password must contain at least one digit.';
    }
    // Password must not contain only numbers
    else if (RegExp(r'^[0-9]+$').hasMatch(password)) {
      return 'The password must not contain only numbers.';
    }
  }
  return null;
}

//************************************************ ///validate Name
String? validateName({required String name}) {
  if (name.isEmpty) {
    return AppStrings.nameValidate;
  }
  // Check if the name contains any digits or special characters
  else if (RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]').hasMatch(name)) {
    return 'The name cannot contain digits or special characters.';
  }
  return null;
}

//************************************************ ///validate Phone
String? validatePhone(String phone) {
  const String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final RegExp regex = RegExp(pattern);
  // Asynchronous Firebase Firestore check for existing phone number
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final CollectionReference usersCollection = firestore.collection('Users');
  // final QuerySnapshot querySnapshot =
  //     await usersCollection.where('phone', isEqualTo: phone).get();
  if (phone.isEmpty) {
    return AppStrings.phoneValidate;
  }
  // else  if (phone.length>=10 && phone.length<=13) {
  //   return '';
  // }
  else if (!regex.hasMatch(phone)) {
    return 'The phone number is invalid. Please enter a valid 10-12 digit phone number.';
  }
  // else if (querySnapshot.docs.isNotEmpty) {
  //   return 'The phone number is already registered.';
  // }
  return null;
}

Future<String?> refreshToken() async {
  final refreshToken = CashHelper.getData(key: 'RefreshToken');
  await DioHelper.getData(
    path: AppEndPoint.refresh,
    queryParameters: {'token': refreshToken},
  ).then((onValue) {
    print('access_token: ${onValue.data['access_token']}');
    if (onValue.statusCode == 200) {
      final newTokens = onValue.data;
      String newAccessToken = newTokens['access_token'];
      CashHelper.saveData(key: 'Token', value: newAccessToken);
      print('access_token: $newAccessToken');
      return newAccessToken;
    }
  }).catchError((onError) {
    return onError.toString();
  });
  return null;
}

String formatDate(String dateTime2) {
  DateTime dateTime = DateTime.parse(dateTime2);
  final day = dateTime.day;
  final month = DateFormat.MMMM().format(dateTime);
  final year = dateTime.year;
  return "$day $month,$year";
}

String formatDate2(String dateTime2) {
  DateTime dateTime = DateTime.parse(dateTime2);
  final day = dateTime.day;
  final month = dateTime.month;
  final year = dateTime.year;
  return "$day/$month/$year";
}
