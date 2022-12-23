import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putbool({required bool dark}) async {
    return await sharedPreferences.setBool('isdark', dark);
  }

  static bool? getbool() {
    return sharedPreferences.getBool('isdark');
  }
}
