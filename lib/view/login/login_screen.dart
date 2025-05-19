import 'package:authentication/res/components/modify_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../viewModel/service/http_service.dart';
import '../../models/login_request.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscured = true;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final request = LoginRequest(
        email: _emailController.text,
        password: _passwordController.text,
      );

      try {
        final response = await HttpService().login(request);
        if (response.error == 0) {
          await HttpService().setToken(response.data.token);
          Navigator.pushReplacementNamed(context, '/home');
          print('Login successful! Token: ${response.data.token}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.msg)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login failed")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
        throw Exception("Error occurred: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: <Widget>[
                  Center(
                    child: Image.asset("assets/images/logos.png",height: 130,width: 130),
                    // child: SvgPicture.asset(
                    //   'assets/images/alpha_logo.svg',
                    //   fit: BoxFit.contain, // Ensures it fits within the given dimensions
                    //   placeholderBuilder: (context) => CircularProgressIndicator(), // Shows a loader if SVG takes time to load
                    // ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                  SizedBox(height: 10),
                  ModifiedText(
                      text: "Enter your email",
                      color: Colors.black,
                      size: 15,
                      fontWeight: FontWeight.w400),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: 17, color: Colors.black),
                        hintText: "yourmail@gmail.com",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  ModifiedText(
                      text: "Enter your password",
                      color: Colors.black,
                      size: 15,
                      fontWeight: FontWeight.w400),
                  TextFormField(
                    obscureText: _isObscured,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      }, icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),),
                        labelStyle:
                            TextStyle(fontSize: 17, color: Colors.black),
                        hintText: "********",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(MediaQuery.sizeOf(context).width, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                    onPressed: _login,
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ModifiedText(
                          text: "Don't have an account? ",
                          color: Colors.grey,
                          size: 14,
                          fontWeight: FontWeight.normal),
                      GestureDetector(
                        // onTap: loginController.navigateToSignUp,
                        child: ModifiedText(
                            text: 'Register',
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
