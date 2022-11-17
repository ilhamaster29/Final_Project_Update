import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen/home_page.dart';
import 'package:splash_screen/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneNumController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xFF149C92),
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildPhoneNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Phone Number',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          controller: _phoneNumController,
          keyboardType: TextInputType.phone,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.phone,
              color: Color(0xFF149C92),
            ),
            hintText: 'Phone Number',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      )
    ],
  );
}

Widget builPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          controller: _passwordController,
          obscureText: true,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xFF149C92),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildRegisterBtn(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 50),
    child: SizedBox(
      height: 40,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text)
              .then((value) {
            print("Created New Account");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF149C92),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('SIGN UP'),
      ),
    ),
  );
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF149C92),
                        Color(0xFFFFFFFF),
                      ]),
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 6.0,
                                color: Colors.black,
                              )
                            ],
                            fontSize: 40,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 50),
                      buildEmail(),
                      const SizedBox(height: 20),
                      buildPhoneNumber(),
                      const SizedBox(height: 20),
                      builPassword(),
                      buildRegisterBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
