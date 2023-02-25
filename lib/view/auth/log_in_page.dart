
import 'package:bijoy_tech_quiz_app/view/auth/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../controller/log_in_page_controller.dart';
import '../common/toast.dart';
import 'fotget_password_page.dart';

class LogInScreen  extends StatelessWidget {

  final logInPageController = Get.put(LogInPageController());
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
     width =MediaQuery.of(context).size.width;
     height =MediaQuery.of(context).size.height;
    return SafeArea(
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
          //  width: 500,
            child: _buildBodyDesign(),
            // color: Colors.amber,
            ),);
          }
        },)
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifecycleState changed: $state");
    if (state == AppLifecycleState.resumed) {
      showToastLong("resumed");
    }
  }

  Widget _buildBodyDesign() {
    return Container(
      color: bg_top_color,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: Image.asset(
              "assets/images/app_logo.png",
              //width: 80,
              height: 80,
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
            child:SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 10,),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Login",
                        style: TextStyle(
                            color: levelTextColorWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.w900)),
                  ),
                  SizedBox(height: 10,),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Login with your email and password!",
                        style: TextStyle(
                            color: levelTextColorWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),

                  SizedBox(height: 30,),


                  //dfg
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  userInputEmail(logInPageController.userEmailController.value, 'Email', TextInputType.emailAddress),

                  const SizedBox(
                    height: 5,
                  ),
                  //password input
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Password",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  userInputPassword(logInPageController.passwordController.value, 'Password',
                      TextInputType.visiblePassword),

                  Align(
                    alignment: Alignment.topRight,
                    child: InkResponse(
                      onTap: () {

                        Get.to(ForgetPasswordScreen());

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ForgotPasswordScreen()));


                      },
                      child: Text("Forget Password?",
                          style: TextStyle(

                              color:  forgottenPasswordTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
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
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text("Don't have an account?  ",
                              style: TextStyle(
                                  color: textColorWhiteLogin,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          InkResponse(
                            onTap: () {

                              Get.to(RegistrationScreen());

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const SignUpScreen()));
                            },
                            child: const Text("Create Account",
                                style: TextStyle(
                                    color: forgottenPasswordTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

        ));
  }

  Widget _buildSignInButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        onPressed: () {
          String userEmailTxt = logInPageController.userEmailController.value.text;
          String passwordTxt = logInPageController.passwordController.value.text;

          if (logInPageController.inputValid(userEmailTxt, passwordTxt)== false) {

            logInPageController.userLogIn(email: userEmailTxt, password: passwordTxt);

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
              "Sign In",
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

  Widget userInputPassword(TextEditingController userInputController, String hintTitle,
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
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 10),
        child: Obx(() => TextField(
          controller: userInputController,
          autocorrect: false,
          obscureText: logInPageController.isObscure.value,
          obscuringCharacter: "*",
          enableSuggestions: false,
          autofocus: false,
          cursorColor: Colors.white,
          style: TextStyle(
              color: Colors.white
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                color:  levelTextColorWhite,
                icon:
                Icon(logInPageController.isObscure.value ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  logInPageController.updateIsObscure(!logInPageController.isObscure.value);
                }),
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),)
      ),
    );
  }

}


