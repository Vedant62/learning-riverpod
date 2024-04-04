import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod_app/homescreen.dart';
import 'package:learning_riverpod_app/logger_riverpod.dart';
import 'package:learning_riverpod_app/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';

//providers provided in riverpod are global but immutable except ...

// Providers
// 1. Provider


// final userProvider = StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier(const User(name: '', age: 0)));
// ^ this thing wants a return type of StateNotifier class.

@riverpod
Future<User> fetchUser(FetchUserRef ref, String input){
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchData(input);
}

//
// final fetchUserProvider = FutureProvider.family((ref, String input) {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchData(input);
// });

void main(){
  runApp( ProviderScope(child: MyApp(), observers: [
    LoggerRiverpod()
  ],));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


