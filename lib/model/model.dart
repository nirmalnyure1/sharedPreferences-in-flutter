enum Gender { FEMALE, MALE, OTHER }

enum ProgrammingLanguage { Dart, Javascript, Kotlin, Swift }

class Setting {
  final String username;
  final Gender gender;
  final bool isEmployed;
  final Set<ProgrammingLanguage> programmingLanguage;
  Setting({
    this.username,
    this.gender,
    this.programmingLanguage,
    this.isEmployed,
  });
}
