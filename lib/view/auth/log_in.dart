import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../static/Colors.dart';


class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController? _emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  bool _isObscure = true;

  int _darkOrLightStatus = 2;

  //social login
  // GoogleSignInAccount? _currentUser;
  Map? userData = {};

  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Container(
        color:_darkOrLightStatus==1?intello_bg_color_deep.withOpacity(.94): message_send_box_bg_color_for_dark.withOpacity(.95),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 70.0, bottom: 50.0),
              child: Image.asset(
                "assets/images/logo1.png",
                width: 218,
                height: 155,
                fit: BoxFit.fill,
              ),
            ),

            Expanded(
              child: _buildBottomDesign(),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBottomDesign() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          color:_darkOrLightStatus==1?Colors.white:intello_bottom_bg_color_for_dark,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
            padding:
            const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  //dfg
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email",
                        style: TextStyle(
                            color: intello_level_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  userInputEmail(
                      _emailController!, 'Email', TextInputType.emailAddress),

                  const SizedBox(
                    height: 5,
                  ),
                  //password input
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Password",
                        style: TextStyle(
                            color: intello_level_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  userInputPassword(passwordController!, 'Password',
                      TextInputType.visiblePassword),

                  Align(
                    alignment: Alignment.topRight,
                    child: InkResponse(
                      onTap: () {

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ForgotPasswordScreen()));


                      },
                      child: Text("Forget Password?",
                          style: TextStyle(

                              color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildSignInButton(),

                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: InkResponse(
                        onTap: () {},
                        child: Text("OR",
                            style: TextStyle(
                                color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),


                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                           Text("Don't have an account?",
                              style: TextStyle(
                                  color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          InkResponse(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const SignUpScreen()));
                            },
                            child: const Text(" Sign Up",
                                style: TextStyle(
                                    color: intello_bg_color,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget _buildSignInButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        onPressed: () {
          String emailTxt = _emailController!.text;
          String passwordTxt = passwordController!.text;
          if (_inputValid(emailTxt, passwordTxt) == false) {
          //  _userLogIn(email: emailTxt, password: passwordTxt);
            //Navigator.push(context,MaterialPageRoute(builder: (context)=> NavigationBarScreen(0,HomeScreen()),));

          } else {}
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  intello_button_color_green,
                  intello_button_color_green
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(7.0)),
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _inputValid(String email, String password) {
    if (email.isEmpty) {
      Fluttertoast.cancel();
      _showToast("Email can't empty");
      return;
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
      //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    )
        .hasMatch(email)) {
      Fluttertoast.cancel();
      _showToast("Enter valid email!");
      return;
    }

    if (password.isEmpty) {
      Fluttertoast.cancel();
      _showToast("Password can't empty!");
      return;
    }
    if (password.length < 8) {
      Fluttertoast.cancel();
      _showToast("Password must be 8 character!");
      return;
    }

    return false;
  }

  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }


  Widget userInputEmail(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color:_darkOrLightStatus==1? ig_inputBoxBackGroundColor:ig_inputBoxBackGroundColor_for_dark,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
         const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInput,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: _darkOrLightStatus==1?intello_text_color:Colors.white,
          style: TextStyle(
              color: _darkOrLightStatus==1?intello_text_color:Colors.white
          ),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            suffixIcon: Icon(Icons.email_outlined,
              color: _darkOrLightStatus==1?icon_color_for_light:icon_color_for_dark,
             size: 20,
            ),


            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18, color: hint_color, fontStyle: FontStyle.normal),

          ),

          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputPassword(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: _darkOrLightStatus==1? ig_inputBoxBackGroundColor:ig_inputBoxBackGroundColor_for_dark,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 10),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          obscureText: _isObscure,
          obscuringCharacter: "*",
          enableSuggestions: false,
          autofocus: false,
          cursorColor: _darkOrLightStatus==1?intello_text_color:Colors.white,
          style: TextStyle(
              color: _darkOrLightStatus==1?intello_text_color:Colors.white
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                color: _darkOrLightStatus==1?icon_color_for_light:icon_color_for_dark,
                icon:
                Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        // return VerificationScreen();
        return Dialog(
          child: Wrap(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 20),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const CircularProgressIndicator(
                          backgroundColor: intello_bg_color,
                          color: Colors.black,
                          strokeWidth: 5,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          message,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ))
            ],
            // child: VerificationScreen(),
          ),
        );
      },
    );
  }

  void userNotActiveDialog(BuildContext context, String email, String userId) {
    showDialog(
      context: context,
      builder: (context) {
        // return VerificationScreen();
        return Dialog(
          child: Container(
            height: 300,
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10, bottom: 10),
            child: Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Text("Verify Your Email Address",
                      style: TextStyle(
                          color: intello_or_text_color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: const Text("We need to verify your email address!",
                              style: TextStyle(
                                  color: intello_small_text_color_for_dark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 0, bottom: 10),
                          child: Text(email,
                              style: const TextStyle(
                                  color: intello_color_tag_text,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Container(
                            margin:
                            const EdgeInsets.only(left: 00.0, right: 10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        intello_bg_color,
                                        intello_bg_color
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Cancel",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'PT-Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:
                            const EdgeInsets.only(left: 10.0, right: 00.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Fluttertoast.cancel();
                                Navigator.of(context).pop();
                                //_sendOtp(userId: userId);

                                // Navigator.push(context,MaterialPageRoute(builder: (context)=> SendOtpForVerifyScreen(),));

                                //_showToast("verify page");
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        intello_button_color_green,
                                        intello_button_color_green
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Verify Mail",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'PT-Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }



















}
