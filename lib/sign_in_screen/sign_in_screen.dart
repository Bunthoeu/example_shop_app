import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop_api/main_screen.dart';
import 'package:product_shop_api/register_screen/register_screen.dart';
import '../auth/bloc/auth_bloc.dart';
import '../controller/controller_email_password.dart';
import '../theme/color.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = false;
  String? _emailError;
  var empty;
  final _auth = FirebaseAuth.instance;
  AuthBloc? authBloc;
  @override
  void initState() {
    authBloc = AuthBloc()..add(AuthLoadingEvent());
    empty = AuthBloc()..add(AuthLogOutEvent());
    super.initState();
  }

  @override
  void dispose() {
    eamilController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: eamilController.text.trim(),
          password: PasswordController.text.trim(),
        );
      } catch (error) {
        setState(() {
          if (error == 'user-not-found') {
            _emailError = 'User not found';
          } else if (error == 'wrong-password') {
            // PasswordController = 'Wrong password';
          } else {
            _emailError = error.toString();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLogedInState) {
          return MainScreen();
        }
        if (state is AuthLogedOutState) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Sign In'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                  child: Center(
                      child: Container(
                margin: EdgeInsets.symmetric(vertical: 70, horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'SIGN IN ACCOUNT',
                        style:
                            TextStyle(fontSize: 25, color: AppColors.blueColor),
                      ),
                      Text(
                        'Complete your details or continue with social media',
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 32),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email address.';
                              } else if (!isValidEmail(value)) {
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
                            controller: eamilController,
                            decoration: InputDecoration(
                                errorText: _emailError,
                                labelText: "Email",
                                border: OutlineInputBorder(

                                    //Outline border type for TextFeild
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: AppColors.blueColor,
                                      width: 2,
                                    )), //normal border
                                enabledBorder: OutlineInputBorder(

                                    //Outline border type for TextFeild
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: AppColors.blueColor,
                                      width: 2,
                                    )), //enabled border
                                focusedBorder: OutlineInputBorder(

                                    //Outline border type for TextFeild
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: AppColors.blueColor,
                                      width: 2,
                                    )),
                                suffixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.blueColor,
                                ),
                                hintText: 'Enter your Email'
                                // set more border style like disabledBorder
                                )),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 32),
                        child: TextField(
                          controller: PasswordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              labelText: "Password",
                              enabledBorder: OutlineInputBorder(

                                  //Outline border type for TextFeild
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    color: AppColors.blueColor,
                                    width: 2,
                                  )),
                              focusedBorder: OutlineInputBorder(

                                  //Outline border type for TextFeild
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    color: AppColors.blueColor,
                                    width: 2,
                                  )),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.blueColor),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              hintText: 'Enter your password'),
                        ),
                      ),
                      state.isloading
                          ? CircularProgressIndicator()
                          : Container(
                              margin: EdgeInsets.only(top: 32),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ElevatedButton(
                                onPressed: () async {
                                  // if (_formKey.currentState!.validate()) {
                                  //   // Form is valid, attempt login
                                  // }
                                  _login();
                                  context.read<AuthBloc>().add(AuthLogInEvent(
                                      email: eamilController.text,
                                      password: PasswordController.text));
                                  // Navigator.of(context)
                                  //     .popUntil((route) => route.isFirst);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 15.0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(color: AppColors.blueColor),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.all(12),
                              height: 70,
                              width: 70,
                              child: Image.asset('assets/images/facebook.png')),
                          Container(
                              padding: EdgeInsets.all(18),
                              height: 70,
                              width: 70,
                              child: Image.asset('assets/images/google.png'))
                        ],
                      )
                    ],
                  ),
                ),
              ))));
        } else {
          return Container();
        }
      },
    );
  }
}
