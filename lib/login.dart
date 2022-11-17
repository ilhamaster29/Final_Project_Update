import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash_screen/home_page.dart';
import 'package:splash_screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

final TextEditingController _emailController = TextEditingController();
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
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
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
        child: const TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
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

Widget buildForgotPassBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: const Text('Forgot Password?'),
    ),
  );
}

Widget buildLoginBtn(BuildContext context) {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          }).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          });
          Fluttertoast.showToast(
            msg: "Login Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 14,
          );
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
        child: const Text('LOG IN'),
      ),
    ),
  );
}

Widget buildDontHaveAcc(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: const Text(
        "Don't have an account yet?",
        style: TextStyle(fontSize: 14, shadows: [
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 2.0,
            color: Colors.black,
          ),
        ]),
      ),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
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
                        'Sign In',
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
                      builPassword(),
                      buildForgotPassBtn(),
                      buildLoginBtn(context),
                      buildDontHaveAcc(context),
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
