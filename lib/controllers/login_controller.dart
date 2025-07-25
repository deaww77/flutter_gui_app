// login_controller.dart
import 'package:flutter/material.dart';
import 'package:form_validate/profile.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกอีเมล';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'อีเมลไม่ถูกต้อง';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกรหัสผ่าน';
    }
    if (value.length < 8) {
      return 'รหัสผ่านต้องไม่น้อยกว่า 8 ตัวอักษร';
    }
    return null;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text;
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('ลงทะเบียนสำเร็จ'),
          content: Text('คุณสามารถเข้าสู่ระบบได้แล้ว'),
          actions: [
            TextButton(
              onPressed: () {
                Get.off(() => const ProfilePage());
              },
              child: Text('ตกลง'),
            ),
          ],
        ),
      );
      // TODO: ทำการ login หรือเชื่อม backend ที่นี่
      Get.snackbar('สำเร็จ', 'ล็อกอินด้วย $email');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
