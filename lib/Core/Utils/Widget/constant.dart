
import '../../Network/Local/cachehelper.dart';

Future<void> singOut({
  required String key,
}) async{
  return await CashHelper.removeData(key: key);
}



