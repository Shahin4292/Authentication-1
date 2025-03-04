import 'package:authentication/view/login_screen/widget/custom_password_field.dart';
import 'package:authentication/view/login_screen/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Res/colors/app_colors.dart';
import '../../res/assets/app_assets.dart';
import '../../res/components/round_button.dart';
import '../../res/components/text.dart';
import '../../viewModel/login_controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: loginController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppAssets.alpha,
                        height: 150,
                        width: 136,
                      ),
                    ),
                    Text("Login",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        ModifiedText(text: "Enter your email", color: Colors.black, size: 15, fontWeight: FontWeight.w400),
                        CustomTextField(loginController: loginController),
                        SizedBox(height: 5),
                        ModifiedText(text: "Enter your password", color: Colors.black, size: 15, fontWeight: FontWeight.w400),
                        CustomPasswordField(loginController: loginController),
                        GestureDetector(
                          // onTap: loginController.forgotPassword,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ModifiedText(
                              text: 'Forgot Password',
                              color: AppColor.redShade,
                              fontWeight: FontWeight.normal,
                              size: 14,
                            ),
                          ),
                        ),
                        RoundButton(
                          title: 'Login',
                          onPress: loginController.login,
                          height: 60,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      ],
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
      ),
    );
  }
}
