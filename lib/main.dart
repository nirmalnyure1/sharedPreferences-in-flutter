import 'package:all_about_shared_preference/preferences_services.dart';
import 'package:flutter/material.dart';

import 'model/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesServices();
  final _usernameController = TextEditingController();
  var _selectGender = Gender.FEMALE;
  var _selectedLanguage = Set<ProgrammingLanguage>();
  var _isEmployed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final setting = await _preferencesService.getSettting();
    setState(() {
      _usernameController.text = setting.username;
      _selectGender = setting.gender;
      _selectedLanguage = setting.programmingLanguage;
      _isEmployed = setting.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Preferences",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shared Preferences'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "username"),
              ),
            ),
            RadioListTile(
                title: Text('Female'),
                value: Gender.FEMALE,
                groupValue: _selectGender,
                onChanged: (value) {
                  setState(() {
                    _selectGender = value;
                  });
                }),
            RadioListTile(
                title: Text('Male'),
                value: Gender.MALE,
                groupValue: _selectGender,
                onChanged: (value) {
                  setState(() {
                    _selectGender = value;
                  });
                }),
            RadioListTile(
                title: Text('Other'),
                value: Gender.OTHER,
                groupValue: _selectGender,
                onChanged: (value) {
                  setState(() {
                    _selectGender = value;
                  });
                }),
            CheckboxListTile(
                title: Text('Dart'),
                value: _selectedLanguage.contains(ProgrammingLanguage.Dart),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.Dart)
                        ? _selectedLanguage.remove(ProgrammingLanguage.Dart)
                        : _selectedLanguage.add(ProgrammingLanguage.Dart);
                  });
                }),
            CheckboxListTile(
                title: Text('Javascript'),
                value:
                    _selectedLanguage.contains(ProgrammingLanguage.Javascript),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.Javascript)
                        ? _selectedLanguage
                            .remove(ProgrammingLanguage.Javascript)
                        : _selectedLanguage.add(ProgrammingLanguage.Javascript);
                  });
                }),
            CheckboxListTile(
                title: Text('Kotlin'),
                value: _selectedLanguage.contains(ProgrammingLanguage.Kotlin),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.Kotlin)
                        ? _selectedLanguage.remove(ProgrammingLanguage.Kotlin)
                        : _selectedLanguage.add(ProgrammingLanguage.Kotlin);
                  });
                }),
            CheckboxListTile(
                title: Text('Swift'),
                value: _selectedLanguage.contains(ProgrammingLanguage.Swift),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage.contains(ProgrammingLanguage.Swift)
                        ? _selectedLanguage.remove(ProgrammingLanguage.Swift)
                        : _selectedLanguage.add(ProgrammingLanguage.Swift);
                  });
                }),
            SwitchListTile(
                title: Text("IsEmployed"),
                value: _isEmployed,
                onChanged: (value) {
                  setState(() {
                    _isEmployed = value;
                  });
                }),
            Container(
                child: TextButton(
              onPressed: _savesetting,
              child: Text("save Setting"),
            )),
          ],
        ),
      ),
    );
  }

  void _savesetting() {
    final newSetting = Setting(
        username: _usernameController.text,
        gender: _selectGender,
        programmingLanguage: _selectedLanguage,
        isEmployed: _isEmployed);
    _preferencesService.saveSettings(newSetting);
  }
}
