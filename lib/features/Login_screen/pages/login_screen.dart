// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theme_app/Shared/core/utils/app_router.dart';
import 'package:theme_app/Shared/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
 const LoginPage({Key? key}) : super(key: key);

 @override
 State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 bool isLoading = false;

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            header(),
            inputField(),
            forgotPassword(),
            signup(),
          ],
        ),
      ),
    );
 }

 Widget header() {
    return const Column(
      children: [
        Text(
          "iGenTech",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        Text("Enter your credentials to login"),
      ],
    );
 }

 Widget inputField() {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFormField(
            hintText: 'Email',
            icon: Icons.email,
            validator: validateEmail,
            controller: emailController,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: 'Password',
            icon: Icons.password,
            validator: validatePassword,
            controller: passwordController,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                isLoading = true;
                setState(() {});
                await _login();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.purple,
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
 }

 Widget forgotPassword() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.purple),
      ),
    );
 }

 Widget signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSignUpView);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.purple),
            ))
      ],
    );
 }

 String? validateEmail(String? value) {
   if (value!.isEmpty) {
     return "Please enter your email";
   }
   return null;
 }

 String? validatePassword(String? value) {
   if (value!.isEmpty) {
     return "Please enter your password";
   }
   return null;
 }

Future<void> _login() async {
 try {
   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
     email: emailController.text,
     password: passwordController.text,
   );
   if (!userCredential.user!.emailVerified) {
     showSnackBar("Please verify your email.", Colors.red);
     await FirebaseAuth.instance.signOut();
   } else {
     // Email is verified
     showSnackBar("Logged in successfully", Colors.black);
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
   }
 } on FirebaseAuthException catch (e) {
 handleFirebaseErrors(e);
 } finally {
   isLoading = false;
   setState(() {});
 }
}


void handleFirebaseErrors(FirebaseAuthException e) {
 if (e.message?.contains("The supplied auth credential is incorrect") == true ||
      e.message?.contains("malformed") == true ||
      e.message?.contains("expired") == true) {
    showSnackBar("Incorrect email or password. Please try again.", Colors.red);
 } else {
    showSnackBar("An error occurred: ${e.message}", Colors.red);
 }
}


void showSnackBar(String message, Color color) {
 final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin: const EdgeInsets.only(bottom: 20),
    duration: const Duration(seconds: 3),
 );
 ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
}
