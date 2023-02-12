
import 'package:bijoy_tech_quiz_app/view/auth/registration_page2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../static/Colors.dart';
import '../../controller/log_in_page_controller.dart';
import '../../controller/sign_up_page_controller.dart';
import '../../controller/sign_up_page_controller2.dart';
import '../common/toast.dart';
import 'fotget_password_page.dart';
import 'log_in_page.dart';




class RegistrationScreen  extends StatelessWidget {

  final signUpPageController = Get.put(SignUpPageController());

  var width;
  var height;
  late BuildContext _context;


  // String _particularBirthDate="Enter Birthday";
  // String select_your_country="Enter Birthday";
  late DateTime _myDate;

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

                  SizedBox(height: 10,),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Registration",
                        style: TextStyle(
                            color: levelTextColorWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.w900)),
                  ),


                  SizedBox(height: 20,),



                  //full name
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Full Name",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputFullName( signUpPageController.userNameController.value, 'Full Name', TextInputType.text),


                  //email
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
                  userInputEmail(signUpPageController.userEmailController.value, 'Email', TextInputType.emailAddress),


                  //phone
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Phone Number",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputPhoneNumber(signUpPageController.userPhoneController.value, 'Phone Number', TextInputType.emailAddress),


                  //phone
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Date of Birth",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputBirthDay( ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Grade",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userGradeSelect(),
                  const SizedBox(
                    height: 15,
                  ),
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
                  userInputPassword(signUpPageController.passwordController.value, 'New Password',
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
                  userInputConfirmPassword(signUpPageController.confirmPasswordController.value, 'Confirm Password',
                      TextInputType.visiblePassword),


                  const SizedBox(
                    height: 10,
                  ),
                  _buildSignUpButton(),


                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text("Already have an account? ",
                              style: TextStyle(
                                  color: textColorWhiteLogin,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          InkResponse(
                            onTap: () {
                              Get.off(LogInScreen());
                            },
                            child: const Text("Sign In",
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

  Widget userInputFullName(TextEditingController userInputController, String hintTitle,
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
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInputController,
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
            suffixIcon: Icon(Icons.person,
              color:  levelTextColorWhite,
              size: 18,
            ),


            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 16, color: hint_color, fontStyle: FontStyle.normal),

          ),

          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputPhoneNumber(TextEditingController userInputController, String hintTitle,
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
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInputController,
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
            suffixIcon: Icon(Icons.phone,
              color:  levelTextColorWhite,
              size: 18,
            ),


            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 16, color: hint_color, fontStyle: FontStyle.normal),

          ),

          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputEmail(TextEditingController userInput, String hintTitle,
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
              color:levelTextColorWhite,
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
          obscureText: signUpPageController.isObscurePassword.value,
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
                Icon(signUpPageController.isObscurePassword.value ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  signUpPageController.updateIsObscurePassword(!signUpPageController.isObscurePassword.value);
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
          obscureText: signUpPageController.isObscureConfirmPassword.value,
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
                Icon(signUpPageController.isObscureConfirmPassword.value ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  signUpPageController.updateIsObscureConfirmPassword(!signUpPageController.isObscureConfirmPassword.value);
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


  Widget userGradeSelect() {
    return Column(
      children: [
        Container(
          // height: 50,
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20,),
            decoration: BoxDecoration(
                color:input_box_back_ground_color,

                borderRadius: BorderRadius.circular(5)),
            child: Obx(()=>DropdownButton2(
              //  buttonHeight: 40,
              //   menuMaxHeight:55,
              itemPadding: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: bg_top_color,


              ),
              iconSize: 30,
              icon:Padding(padding: EdgeInsets.only(right: 10),child:  Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,),),
              value: signUpPageController.selectGradeId.value != null &&
                  signUpPageController.selectGradeId.value.isNotEmpty ?
              signUpPageController.selectGradeId.value : null,
              underline:const SizedBox.shrink(),
              hint:Row(
                children: const [

                  Expanded(child: Padding(padding: EdgeInsets.only(left: 25),
                    child:  Text("Selected State",
                          style: TextStyle(
                              color: hint_color,
                              fontSize: 16,
                              fontWeight: FontWeight.normal))
                  ))
                ],
              ),
              isExpanded: true,
              /// icon: SizedBox.shrink(),
              buttonPadding: const EdgeInsets.only(left: 0, right: 0),


              items: signUpPageController.ageGradeList.map((list) {
                return DropdownMenuItem(
                  alignment: Alignment.centerLeft,



                  // value: list["id"].toString(),
                  value: list.gradeName.toString(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child:Padding(
                        padding: EdgeInsets.only(left: 25),
                        child:Text(
                            list.gradeName,
                            textAlign: TextAlign.left,
                            style:  const TextStyle(
                                color: textColorWhiteLogin,

                                fontSize: 15,
                                fontWeight: FontWeight.normal)),

                      ),),




                    ],
                  ),
                );

              },
              ).toList(),
              onChanged:(String? value){
                String data= signUpPageController.selectGradeId(value.toString());
                //  _showToast("Id ="+checkoutPageController.selectStateId(value.toString()));
              },

            ))
        ),
      ],
    )
    ;
  }


  ///user input birth date select box
  Widget userInputBirthDay( ) {
    return InkResponse(
      onTap: () async {
        _myDate = (await showDatePicker(
          context: _context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ))!;

        signUpPageController.userBirthDate(_myDate.toString());
        // _particularBirthDate = DateFormat('yyyy-MM-dd').format(_myDate);
        signUpPageController.userBirthDate((DateFormat('yyyy-MM-dd').format(_myDate)).toString());


      },
      child:Container(
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: input_box_back_ground_color,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding:
            const EdgeInsets.only(left: 15.0, top: 0, bottom: 0, right: 10),
            child: SizedBox(
              height: 50,

              child: Padding(
                padding:  const EdgeInsets.only(left: 10.0, top: 0,bottom: 0, right: 10),
                child:Obx(() => Flex(direction: Axis.horizontal,
                  children: [
                    if(signUpPageController.userBirthDate==signUpPageController.select_your_birth_day)...{
                      Expanded(child: Obx(() => Text(signUpPageController.userBirthDate.value,
                          style: const TextStyle(
                              color: hint_color,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)
                      ))),
                    }
                    else...{
                      Expanded(child: Obx(() => Text(signUpPageController.userBirthDate.value,
                          style: const TextStyle(
                              color: textColorWhiteLogin,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)
                      ))),
                    },

                    const Icon(
                      Icons.date_range,
                      size: 22,
                      color: levelTextColor,
                    ),



                    // Image.asset(
                    //   "assets/images/icon_birthday.png",
                    //   width: 18,
                    //   height: 18,
                    //   fit: BoxFit.fill,
                    // ),
                    // Flag.fromCode(FlagsCode.BD, height: 18, width: 22, fit: BoxFit.fill)
                  ],
                )),

              ),
            ),
        ),
      )

    );
  }

  Widget _buildSignUpButton() {
    return Container(
      margin: const EdgeInsets.only(left: 00.0, right: 00.0),
      child: ElevatedButton(
        onPressed: () {

          String userNameTxt = signUpPageController.userNameController.value.text;
          String userEmailTxt = signUpPageController.userEmailController.value.text;
          String userPhoneTxt = signUpPageController.userPhoneController.value.text;
          String passwordTxt = signUpPageController.passwordController.value.text;
          String confirmPasswordTxt = signUpPageController.confirmPasswordController.value.text;


        //  showToastShort(signUpPageController.userBirthDate.value);

          if (signUpPageController.inputValid(
                  userNameTxt: userNameTxt,
                  userEmailTxt: userEmailTxt,
                  userPhoneTxt: userPhoneTxt,
                  passwordTxt: passwordTxt,
                  confirmPasswordTxt: confirmPasswordTxt,
                  userDateOfBirthTxt: signUpPageController.userBirthDate.value,
                  userAgeGradeTxt: signUpPageController.selectGradeId.value
               )== false){
            // LogInApiService().userLogIn(email: userEmailTxt, password: passwordTxt);


           Get.to(() => RegistrationScreen2(), arguments: {
             "userNameTxt": userNameTxt,
             "userEmailTxt": userEmailTxt,
             "userPhoneTxt": userPhoneTxt,
             "passwordTxt": passwordTxt,
             "confirmPasswordTxt": confirmPasswordTxt,
             "userDateOfBirthTxt": signUpPageController.userBirthDate.value,
             "userAgeGradeTxt": signUpPageController.selectGradeId.value,

           })?.then((value) => Get.delete<SignUpPageController2>());

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
              "Next",
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


