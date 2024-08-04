import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  final SharedPreferences sharedPreferences;

  AppSharedPreferences(this.sharedPreferences);

  Future<void> setFullName(String fullName) {
    return sharedPreferences.setString('fullName', fullName);
  }

  Future<String> getFullName() async {
    return sharedPreferences.getString('fullName') ?? '';
  }

  Future<void> setPhoneNumber(String phone) {
    return sharedPreferences.setString('phone_number', phone);
  }

  Future<String> getPhoneNumber() async {
    return sharedPreferences.getString('phone_number') ?? '';
  }

  Future<void> setPassword(String password) {
    return sharedPreferences.setString('password', password);
  }

  Future<String> getPassword() async {
    return sharedPreferences.getString('password') ?? '';
  }

  Future<void> setAccount(String account) {
    return sharedPreferences.setString('account', account);
  }

  Future<String> getAccount() async {
    return sharedPreferences.getString('account') ?? '';
  }

  Future<void> setIdCardNumber(String value) {
    return sharedPreferences.setString('ic_card_number', value);
  }

  Future<String> getIdCardNumber() async {
    return sharedPreferences.getString('ic_card_number') ?? '';
  }

  Future<void> setEmail(String value) {
    return sharedPreferences.setString('email', value);
  }

  Future<String> getEmail() async {
    return sharedPreferences.getString('email') ?? '';
  }

  Future<bool> canSignViaBiometric() async {
    final account = await getAccount();
    final password = await getPassword();
    final canAuthBiometric = await isAuthBiometric();
    return (account.isNotEmpty && password.isNotEmpty && canAuthBiometric);
  }

  Future<void> setAuthBiometric(bool isBiometric) {
    return sharedPreferences.setBool('isBiometric', isBiometric);
  }

  Future<bool> isAuthBiometric() async {
    return sharedPreferences.getBool('isBiometric') ?? false;
  }
}
