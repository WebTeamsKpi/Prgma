class User {
  String name;
  String id;
  String password;
  List<dynamic> projects;
  User({this.name, this.id, this.password, this.projects});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson['id'],
        name: parsedJson['name'],
        password: parsedJson['password'],
        projects: parsedJson['projects']);
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
      };
}
