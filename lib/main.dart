import 'package:authentication/view/change_password/password_change_screen.dart';
import 'package:flutter/material.dart';
import 'viewModel/service/http_service.dart';
import 'view/login/login_screen.dart';
import 'view/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await HttpService().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Exam',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/password-change': (context) => PasswordChangeScreen(),
      },
    );
  }
}