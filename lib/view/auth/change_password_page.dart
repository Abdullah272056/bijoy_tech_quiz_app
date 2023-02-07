
import 'package:bijoy_tech_quiz_app/view/auth/registration_page2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../static/Colors.dart';
import '../../controller/change_password_page_controller.dart';
import '../../controller/log_in_page_controller.dart';
import '../../controller/sign_up_page_controller.dart';
import '../common/toast.dart';
import 'fotget_password_page.dart';
import 'log_in_page.dart';




class ChangePasswordScreen  extends StatelessWidget {

  final changePasswordPageController = Get.put(ChangePasswordPageController());

  var width;
  var height;
  late BuildContext _context;



  @override
  Widget build(BuildContext context) {
    _context=context;
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
      color: bg_top_color,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Image.asset(
              "assets/images/app_logo.png",
             // width: 50,
              height: 50,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),

                        Image.asset(
                          "assets/images/change_password.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                          color: forgottenPasswordTextColor,
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin:const EdgeInsets.only(right: 10.0,top: 10,left: 10,bottom: 0),
                    child: const Align(alignment: Alignment.center,
                      child: Text(
                        "Change Password",
                        textAlign: TextAlign.center,

                        style: TextStyle(
                            color:textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(right: 20.0,top: 10,left: 10,bottom: 0),
                    child: const Align(alignment: Alignment.center,
                      child: Text(
                        "Change password for your account secure!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),),
                  ),
                  SizedBox(height: 30,),


                  //password input
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Old Password",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputOldPassword(changePasswordPageController.oldPasswordController.value, 'Old Password',
                      TextInputType.visiblePassword),


                  //password input
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("New Password",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputPassword(changePasswordPageController.passwordController.value, 'New Password',
                      TextInputType.visiblePassword),


                  //confirm password
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Confirm Password",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputConfirmPassword(changePasswordPageController.confirmPasswordController.value, 'Confirm Password',
                      TextInputType.visiblePassword),


                  const SizedBox(
                    height: 10,
                  ),
                  _buildSignUpButton(),

                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            )

        ));
  }

  Widget userInputOldPassword(TextEditingController userInputController, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 50,
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
            obscureText: changePasswordPageController.isObscureOldPassword.value,
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
                  Icon(changePasswordPageController.isObscureOldPassword.value ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    changePasswordPageController.updateIsObscureOldPassword(!changePasswordPageController.isObscureOldPassword.value);
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


  Widget userInputPassword(TextEditingController userInputController, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 50,
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
          obscureText: changePasswordPageController.isObscurePassword.value,
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
                Icon(changePasswordPageController.isObscurePassword.value ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  changePasswordPageController.updateIsObscurePassword(!changePasswordPageController.isObscurePassword.value);
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

  Widget userInputConfirmPassword(TextEditingController userInputController, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 50,
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
          obscureText: changePasswordPageController.isObscureConfirmPassword.value,
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
                Icon(changePasswordPageController.isObscureConfirmPassword.value ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  changePasswordPageController.updateIsObscureConfirmPassword(!changePasswordPageController.isObscureConfirmPassword.value);
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



  Widget _buildSignUpButton() {
    return Container(
      margin: const EdgeInsets.only(left: 00.0, right: 00.0),
      child: ElevatedButton(
        onPressed: () {


          String passwordTxt = changePasswordPageController.passwordController.value.text;
          String confirmPasswordTxt = changePasswordPageController.confirmPasswordController.value.text;
          String oldPasswordTxt = changePasswordPageController.oldPasswordController.value.text;




          if ( changePasswordPageController.inputValid(
                  passwordTxt: passwordTxt,
                  confirmPasswordTxt: confirmPasswordTxt,
                  oldPassword: oldPasswordTxt,
               )== false){
            // LogInApiService().userLogIn(email: userEmailTxt, password: passwordTxt);
            Get.to(RegistrationScreen2());
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
              "Submit",
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
 

}

