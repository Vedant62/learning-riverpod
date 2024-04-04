import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user.g.dart';
class User{
  final String name;
  final String email;

//<editor-fold desc="Data Methods">
// ctrl + n
  const User({
    required this.name,
    required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email);

  @override
  int get hashCode => name.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User{ name: $name, email: $email,}';
  }

  String fromJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));



  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     name: json['name'],
  //     email: json['email'],
  //   );
  // }

//</editor-fold>
}
@riverpod
UserRepository userRepository(UserRepositoryRef ref){
  return UserRepository(ref);
}

// final userRepositoryProvider = Provider((ref) => UserRepository());
class UserRepository{
  final Ref ref;
  UserRepository(this.ref);
  Future<User> fetchData(String input){
    var url = "https://jsonplaceholder.typicode.com/users/$input";
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}