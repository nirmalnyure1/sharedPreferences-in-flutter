import 'package:shared_preferences/shared_preferences.dart';

import 'model/model.dart';

class PreferencesServices {
  Future saveSettings(Setting setting) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString("username", setting.username);
    await preferences.setBool('isEmployed', setting.isEmployed);
    await preferences.setInt('gender', setting.gender.index);
    await preferences.setStringList(
        'programmingLanguage',
        setting.programmingLanguage
            .map((lang) => lang.index.toString())
            .toList());

    print("saved settings");
  }

  Future<Setting> getSettting() async {
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getString("username");
    final isEmployed = preferences.getBool('isEmployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];
    final programmingLanguafeIndicies =
        preferences.getStringList('programmingLanguage');

    final programmingLanguage = programmingLanguafeIndicies
        .map((e) => ProgrammingLanguage.values[int.parse(e)])
        .toSet();

    return Setting(
      username: username,
      gender: gender,
      programmingLanguage: programmingLanguage,
      isEmployed: isEmployed,
    );
  }
}
