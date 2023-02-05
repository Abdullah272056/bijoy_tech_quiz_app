
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../static/Colors.dart';

import '../../controller/forget_password_page_controller.dart';
import '../common/loading_dialog.dart';
import '../common/toast.dart';
import 'log_in_page.dart';

class ForgetPasswordScreen extends StatelessWidget {

  final forgetPasswordPageController = Get.put(ForgetPasswordPageController());

  var width;
  var height;
  @override
  Widget build(BuildContext context) {

    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
          backgroundColor:  backGroundColor,
          body: LayoutBuilder(builder: (context,constraints){
            if(constraints.maxWidth<600){
              return _buildBodyDesign();
            }
            else{
              return Center(child:
              Container(
                // height: 100,
                width: 500,
                child: _buildBodyDesign(),
                // color: Colors.amber,
              ),);
            }
          },)
      ),
    );



  }


  Widget _buildBodyDesign() {
    return Container(
      color:bg_top_color,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: Image.asset(
              "assets/images/app_logo.png",
              width: 66,
              height: 66,
              fit: BoxFit.fill,
            ),
          ),

          Expanded(
            child: _buildBottomDesign(),

          ),
        ],
      ),
    );
  }

  Widget _buildBottomDesign() {
    return Container(
        width: Get.size.width,
        decoration:  BoxDecoration(
          color: bottom_bg_color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
            padding:
            const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
            child:Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      margin:  EdgeInsets.only(
                        left:20,right: 20,top: 10,bottom: 15
                      ),
                      child: Image.asset(
                        "assets/images/icon_forgot.png",
                        width: 60,
                        height: 60,
                        color: forgottenPasswordTextColor,
                      ),
                    ),

                    const Text(
                      "Forget Your Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:textColorWhiteLogin,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter your email address associated with your account "
                          "we will send you a link to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: smallTextColorWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),

                    SizedBox(height: 25,),


                    //dfg
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email",
                          style: TextStyle(
                              color: levelTextColorWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    userInputEmail(forgetPasswordPageController.emailController.value, 'Enter email', TextInputType.emailAddress),

                    const SizedBox(
                      height: 20,
                    ),

                    _buildSendButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildSignUpQuestion(),

                    const SizedBox(
                      height: 40,
                    ),

                  ],
                ),
              ),
            )

        ));
  }

  Widget userInputEmail(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInput,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: Colors.white,
          style: TextStyle(
              color: Colors.white
          ),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            suffixIcon: Icon(Icons.email_outlined,
              color:  levelTextColorWhite,
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

  Widget _buildSendButton() {
    return Container(
      margin: const EdgeInsets.only(left: 00.0, right: 00.0),
      child: ElevatedButton(
        onPressed: () {
          String emailTxt = forgetPasswordPageController.emailController.value.text;
          if (_inputValid(emailTxt) == false) {
            _sendEmailForOtp(email: emailTxt);
          }
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        child: Ink(
          decoration: BoxDecoration(
              color: forgottenPasswordTextColor,
              borderRadius: BorderRadius.circular(7.0)),
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              "Send",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColorWhiteLogin,
              ),
            ),
          ),
        ),
      ),
    );
  }
//join now asking
  Widget _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        Text(
          "Already have an Account? ",
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 15,
            color:textColorWhiteLogin,
          ),
        ),
        InkWell(
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:forgottenPasswordTextColor,
            ),
          ),
          onTap: () {

            Get.to(LogInScreen());

          },
        ),
      ],
    );
  }

  _inputValid(String email) {
    if (email.isEmpty) {
      Fluttertoast.cancel();
      showToastLong("E-mail can't empty!");
      return;
    }
    if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      Fluttertoast.cancel();
      showToastLong("Enter valid email!");
      return;
    }
    return false;
  }

  _sendEmailForOtp({
    required String email,
  }) async {

    try {
      // final result = await InternetAddress.lookup('example.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //   try {
      //
       //    showLoadingDialog("Checking");
      //
      //     var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_RESET_PASSWORD'),
      //     //var response = await http.post(Uri.parse('http://192.168.68.106/bijoytech_ecomerce/api/reset-password'),
      //         body: {
      //           'email': email,
      //         }
      //     );
      //     Get.back();
      //     // _showToast(response.statusCode.toString());
      //     if (response.statusCode == 200) {
      //       showToastLong("success");
      //       // var data = jsonDecode(response.body);
      //
      //
      //       // Get.to(SignUpScreen());
      //
      //       Get.to(() => EmailVerificationScreen(), arguments: [
      //         {"email": email},
      //         {"second": 'Second'}
      //       ]);
      //
      //
      //     }
      //     else if (response.statusCode == 401) {
      //
      //       var data = jsonDecode(response.body);
      //       showToastLong("User name or password not match!");
      //     }
      //     else {
      //
      //       var data = jsonDecode(response.body);
      //      // _showToast(data['message']);
      //     }
      //
      //
      //   } catch (e) {
      //     //  Navigator.of(context).pop();
      //     //print(e.toString());
      //   } finally {
      //
      //
      //     /// Navigator.of(context).pop();
      //   }
      // }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      showToastLong("No Internet Connection!");
    }
  }


}
