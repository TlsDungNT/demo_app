import 'dart:ui';

import 'package:demo_app/system.dart';
import 'package:demo_app/utilities/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/ellipse.png"),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/ellipse2.png"),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/ellipse3.png"),
          ),
          buildBody(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () => hideKeyboardAndUnFocus(context),
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 128, right: 32, left: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //can le bat dau cua clumn la ben trai
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Email",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9796A1)),
              ),
              const SizedBox(
                height: 32,
              ),
              myTextField(
                  keyboradType: TextInputType.emailAddress,
                  maxLengthInput: 50,
                  textCapitalization: TextCapitalization.words,
                  hintText: "Enter your email",
                  controller: emailController),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9796A1)),
              ),
              const SizedBox(
                height: 32,
              ),
              myTextField(
                keyboradType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                maxLengthInput: 20,
                obscureText: true,
                hintText: "Enter your password",
              ),
              const SizedBox(
                height: 16,
              ),
              forgotPasswordButton(),
              const SizedBox(
                height: 16,
              ),
              loginButton(),
              const SizedBox(
                height: 32,
              ),
              signUp(),
              const SizedBox(
                height: 32,
              ),
              signUpWith(),
              const SizedBox(
                height: 16,
              ),
              socialLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget myTextField(
      {TextEditingController? controller,
      required TextInputType keyboradType,
      required TextCapitalization textCapitalization,
      required int maxLengthInput,
      bool obscureText = false,
      String? hintText,
      IconData? suffixIcon,
      VoidCallback? onTapSufixIcon}) {
    return Container(
      height: 64,
      child: TextField(
        controller: controller,
        autocorrect: false,
        keyboardType: keyboradType,
        textCapitalization: textCapitalization,
        inputFormatters: [LengthLimitingTextInputFormatter(maxLengthInput)],
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: inputBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainPurple),
            ),
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: () {
                      if (onTapSufixIcon != null) {
                        onTapSufixIcon();
                      }
                    },
                    child: Icon(suffixIcon),
                  )
                : null),
      ),
    );
  }

  Widget forgotPasswordButton() {
    return Center(
      child: TextButton(
        onPressed: forgotPasswordAction,
        child: Text(
          'Fotgot password?',
          style: TextStyle(color: Color(0xFFFE724C)),
        ),
      ),
    );
  }

  void forgotPasswordAction() {
    print('click forgot password');
  }

  Widget loginButton() {
    return Center(
      child: Container(
        width: 240,
        height: 60,
        child: ElevatedButton(
          onPressed: loginButtonAction,
          child: Text('LOGIN'),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFE724C)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              shadowColor: MaterialStateProperty.all<Color>(Color(0xFFFE724C)),
              elevation: MaterialStateProperty.all(5)),
        ),
      ),
    );
  }

  void loginButtonAction() {
    print('Email: ${emailController.text}');
  }

  Widget signUp() {
    return GestureDetector(
      onTap: signUpAction,
      child: Center(
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Don’t have an account? ",
              style: TextStyle(color: Color(0xFF5B5B5E))),
          TextSpan(
            text: "Sign up",
            style: TextStyle(color: Color(0xFFFE724C)),
          )
        ])),
      ),
    );
  }

  void signUpAction() {
    print('click signUp Action');
  }

  Widget signUpWith() {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 1,
          color: Colors.grey[400],
        )),
        Text("  Sign in with  "),
        Expanded(
            child: Container(
          height: 1,
          color: Colors.grey[400],
        ))
      ],
    );
  }

  Widget buttonSignWith(
      {VoidCallback? onTapFunction,
      String? assetsImages,
      required String name}) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (assetsImages != null) Image.asset(assetsImages),
            const SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(0, 1),
              )
            ]),
      ),
    );
  }

  Widget socialLogin() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: buttonSignWith(
              name: "FACEBOOK",
              assetsImages: "assets/logo_facebook.png",
              onTapFunction: onLoginWithFacebook),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 1,
          child: buttonSignWith(
              name: "GOOGLE",
              assetsImages: "assets/logo_google.png",
              onTapFunction: onLoginWithGoogle),
        ),
      ],
    );
  }

  void onLoginWithFacebook() {
    print('login with facebook');
  }

  void onLoginWithGoogle() {
    print('login with google');
  }
}
