import 'package:shared_preferences/shared_preferences.dart';

class AppValues {
  void setServerUrl(String serverUrl) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_url", serverUrl);
  }

  void setServerPort(String serverPort) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_port", serverPort);
  }

  void setDefaultLanguage(String selectedLanguage) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("DefaultLanguage", selectedLanguage);
  }

  Future<String> getServerUrl() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("server_url") ?? "";
  }

  Future<String> getServerPort() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("server_port") ?? "";
  }

  Future<String> getDefaultLanguage() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("DefaultLanguage") ?? "English";
  }

  void resetPreferences() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("server_url");
    sharedPref.remove("server_port");
  }
}
