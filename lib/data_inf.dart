import 'package:shared_preferences/shared_preferences.dart';

abstract class DataInf {
  Future<int> getData();
  void setData(int count);
}

class SharedPrefsAccess implements DataInf {

  Future<int> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0).toInt();
    return counter;
  }

  Future<void> setData(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', count);
    print("Set state to prefs $count");
  }

}

