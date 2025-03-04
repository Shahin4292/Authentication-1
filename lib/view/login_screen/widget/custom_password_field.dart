import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../res/colors/app_colors.dart';
import '../../../viewModel/login_controller/login_controller.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black,width: 1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                focusNode: loginController.passwordFocusNode,
                controller: loginController.passwordController,
                obscureText: loginController.isPasswordHidden.value,
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                  hintText: "********",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
              ),
            ),
            GestureDetector(
              onTap: loginController.togglePasswordVisibility,
              child: Icon(
                loginController.isPasswordHidden.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
