import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_services.dart';
import 'package:flutter_firebase/widgets/app_button.dart';
import 'package:flutter_firebase/widgets/custom_textfield.dart';
import 'package:flutter_firebase/widgets/top_title.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitle(
                  title: 'Register',
                  subTitle: 'Create an account',
                ),
                CustomTextField(
                  controller: nameController,
                  name: 'Name',
                  prefixIcon: Icons.person_outline,
                  inputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                ),
                CustomTextField(
                  controller: emailController,
                  name: 'Email',
                  prefixIcon: Icons.mail_outline,
                  inputType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  controller: passController,
                  name: 'Password',
                  prefixIcon: Icons.lock_outline,
                  inputType: TextInputType.text,
                  obscureText: true,
                ),
                AppButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AuthServices.createUser(
                        context,
                        nameController.text,
                        emailController.text,
                        passController.text,
                      );
                    }
                  },
                  text: "Register",
                ),
                const SizedBox(height: 30),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
