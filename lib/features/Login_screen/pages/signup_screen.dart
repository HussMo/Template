// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:theme_app/features/Login_screen/widgets/custom_text_field.dart';

class SignupPage extends StatefulWidget {
 const SignupPage({Key? key}) : super(key: key);

 @override
 State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 bool isLoading = false;
 GlobalKey<FormState> formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                 CustomTextFormField(
                    hintText: 'Email',
                    icon: Icons.email,
                    validator: validateEmail,
                    controller: emailController,
                 ),
                 const SizedBox(height: 20),
                 CustomTextFormField(
                    hintText: 'Password',
                    icon: Icons.password,
                    validator: validatePassword,
                    controller: passwordController,
                 ),
                 const SizedBox(height: 20),
                 ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        await signup();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ),
                 )
                ],
              ),
            ),
          ),
        ),
      ),
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

 Future<void> signup() async {
 if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await userCredential.user?.sendEmailVerification();
      showSnackBar("Account created successfully. Please verify your email.", Colors.green);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      handleSignupErrors(e);
    } finally {
      isLoading = false;
      setState(() {});
    }
 } else {
    showSnackBar("Please enter your email and password", Colors.red);
 }
}

 void handleSignupErrors(FirebaseAuthException e) {
 switch (e.code) {
    case 'email-already-in-use':
      showSnackBar("This email is already in use.", Colors.red);
      break;
    case 'weak-password':
      showSnackBar("The password is too weak.", Colors.red);
      break;
    default:
      showSnackBar("An unknown error occurred during signup: ${e.message}", Colors.red);
      break;
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
