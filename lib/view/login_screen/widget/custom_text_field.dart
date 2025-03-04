import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../../res/colors/app_colors.dart';
import '../../../viewModel/login_controller/login_controller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.loginController});

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: loginController.emailController,
              focusNode: loginController.emailFocusNode,
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                hintText: "yourmail@gmail.com",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!GetUtils.isEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(
                  context,
                ).requestFocus(loginController.passwordFocusNode);
              },
            ),
          ),
        ],
      ),
    );
  }
}
