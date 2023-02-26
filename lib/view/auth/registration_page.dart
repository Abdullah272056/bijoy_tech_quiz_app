
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
                //  width: 500,
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
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Image.asset(
              "assets/images/app_logo.png",
              //width: 50,
              height: 35,
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
              child: Obx(()=>Column(
                children: [



                  Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Registration",
                            style: TextStyle(
                                color: levelTextColorWhite,
                                fontSize: 22,
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(height: 10,),

                      // userInputFullName( signUpPageController.userNameController.value, 'Full Name', TextInputType.text),
                      userInput(
                          userInputController: signUpPageController.userNameController.value,
                          hintTitle: 'Full Name', keyboardType:TextInputType.text,
                          iconData: Icons.person
                      ),


                      const SizedBox(
                        height: 3,
                      ),
                      // userInputEmail(signUpPageController.userEmailController.value, 'Email', TextInputType.emailAddress),
                      userInput(
                          userInputController: signUpPageController.userEmailController.value,
                          hintTitle: 'Email', keyboardType:TextInputType.emailAddress,
                          iconData: Icons.email_outlined
                      ),

                      const SizedBox(
                        height: 3,
                      ),
                      // userInputPhoneNumber(signUpPageController.userPhoneController.value, 'Phone Number', TextInputType.emailAddress),
                      userInput(
                          userInputController: signUpPageController.userPhoneController.value,
                          hintTitle: 'Phone Number', keyboardType:TextInputType.phone,
                          iconData: Icons.phone
                      ),

                      const SizedBox(
                        height: 3,
                      ),
                      userInputBirthDay(),

                      const SizedBox(
                        height: 0,
                      ),
                      userGradeSelect(),
                      const SizedBox(
                        height: 13,
                      ),

                      userInputPassword(signUpPageController.passwordController.value, 'New Password',
                          TextInputType.visiblePassword),

                      const SizedBox(
                        height: 3,
                      ),
                      userInputConfirmPassword(signUpPageController.confirmPasswordController.value, 'Confirm Password',
                          TextInputType.visiblePassword),

                    ],
                  ),

                  //Address

                  const SizedBox(
                    height: 3,
                  ),
                  userInput(
                      userInputController: signUpPageController.userAddressController.value,
                      hintTitle: 'Address', keyboardType:TextInputType.text,
                      iconData: Icons.location_city
                  ),


                  const SizedBox(
                    height: 3,
                  ),
                  userInput(
                      userInputController:  signUpPageController.userCityController.value,
                      hintTitle: 'City', keyboardType:TextInputType.text,
                      iconData: Icons.location_city
                  ),

                  const SizedBox(
                    height: 3,
                  ),

                  Row(
                    children: [


                      Expanded(child:   userInput(
                          userInputController:  signUpPageController.userStateController.value,
                          hintTitle: 'State', keyboardType:TextInputType.text,
                          iconData: Icons.location_city
                      ),),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child:  userInput(
                          userInputController:  signUpPageController.zipCodeController.value,
                          hintTitle: 'Zip', keyboardType:TextInputType.text,
                          iconData: Icons.location_city

                      ),),





                    ],
                  ),



                  const SizedBox(
                    height: 3,
                  ),
                  userCountrySelect(),


                  const SizedBox(
                    height: 13,
                  ),

                  if(signUpPageController.selectGradeId.value!="above/adult")...{
                    Column(
                      children: [
                        userInput(

                          userInputController:  signUpPageController.guardianNameController.value,
                          hintTitle: 'Guardian Name', keyboardType:TextInputType.text,
                          // iconData: Icons.location_city


                        ),


                        const SizedBox(
                          height: 3,
                        ),
                        userInput(
                          userInputController:  signUpPageController.relationWithGuardianNameController.value,
                          hintTitle: 'Relation with Guardian', keyboardType:TextInputType.text,
                          // iconData: Icons.location_city

                        ),

                        const SizedBox(
                          height: 3,
                        ),
                        userInput(
                          userInputController:  signUpPageController.guardianPhoneController.value,
                          hintTitle: 'Guardian Phone', keyboardType:TextInputType.text,
                          // iconData: Icons.location_city

                        ),


                        const SizedBox(
                          height: 3,
                        ),
                        userInput(
                          userInputController:  signUpPageController.guardianEmailController.value,
                          hintTitle: 'Guardian Email', keyboardType:TextInputType.text,
                          // iconData: Icons.location_city
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  },



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
              )),
            )
        ));
  }


  Widget userInputPassword(TextEditingController userInputController, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding:
          const EdgeInsets.only(left: 0.0, top: 0, bottom: 0, right: 0),
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

              suffixIcon:Padding(
                padding: EdgeInsets.only(right: 5),
                child:  IconButton(
                    color:  levelTextColorWhite,
                    icon:
                    Icon(signUpPageController.isObscurePassword.value ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      signUpPageController.updateIsObscurePassword(!signUpPageController.isObscurePassword.value);
                    }),
              ),
              contentPadding:  EdgeInsets.only(left: 17, right: 17,top: height/50,bottom:height/50 ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:input_box_OutlineInputBorder_active_color, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:input_box_OutlineInputBorder_de_active_color, width: 1),
              ),
              labelText:hintTitle,
              labelStyle: const TextStyle(
                color:levelTextColor,
              ),
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
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding:
          const EdgeInsets.only(left: 0.0, top: 0, bottom: 0, right: 0),
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

              suffixIcon:Padding(
                padding: EdgeInsets.only(right: 5),
                child:IconButton(
                    color:  levelTextColorWhite,
                    icon:
                    Icon(signUpPageController.isObscureConfirmPassword.value ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      signUpPageController.updateIsObscureConfirmPassword(!signUpPageController.isObscureConfirmPassword.value);
                    }),
              ),
              contentPadding:  EdgeInsets.only(left: 17, right: 17,top: height/50,bottom:height/50 ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:input_box_OutlineInputBorder_active_color, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:input_box_OutlineInputBorder_de_active_color, width: 1),
              ),
              labelText:hintTitle,
              labelStyle: const TextStyle(
                color:levelTextColor,
              ),
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
                border: Border.all(
                    color: input_box_OutlineInputBorder_active_color,
                    width: 1

                ),
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
                      child:  Text("Select Grade",
                          style: TextStyle(
                              color: levelTextColor,
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
              border: Border.all(
                  color: input_box_OutlineInputBorder_active_color,
                  width: 1

              ),
              borderRadius: BorderRadius.circular(5)),
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
                              color: levelTextColor,
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


  Widget userInput({
    required TextEditingController userInputController,
    required String hintTitle,
    required TextInputType keyboardType,
    IconData? iconData,
  }){
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 0.0, top: 0, bottom: 0, right: 0),
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
            // suffixIcon: Icon(Icons.person,
            //   color:  levelTextColorWhite,
            //   size: 18,
            // ),


            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            // hintText: hintTitle,
            // hintStyle: const TextStyle(
            //     fontSize: 16, color: hint_color, fontStyle: FontStyle.normal),


            suffixIcon:Padding(
              padding: EdgeInsets.only(right: 20),
              child:  Icon(iconData,
                color:  levelTextColorWhite,
                size: 18,
              ),
            ),
            contentPadding:  EdgeInsets.only(left: 17, right: 17,top: height/50,bottom:height/50 ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:input_box_OutlineInputBorder_active_color, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:input_box_OutlineInputBorder_de_active_color, width: 1),
            ),
            labelText:hintTitle,
            labelStyle: const TextStyle(
              color:levelTextColor,
            ),






          ),

          keyboardType: keyboardType,
        ),
      ),
    );
  }


  Widget userCountrySelect() {
    return Column(
      children: [
        Container(
          // height: 50,

            alignment: Alignment.center,
            // margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20,),
            decoration: BoxDecoration(
                color:input_box_back_ground_color,
                border: Border.all(
                    color: input_box_OutlineInputBorder_active_color,
                    width: 1

                ),
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
              icon:Padding(padding: EdgeInsets.only(right: 10),
                child:  Icon(Icons.keyboard_arrow_down_outlined,color: levelTextColor,),),
              value: signUpPageController.selectCountryId.value != null &&
                  signUpPageController.selectCountryId.value.isNotEmpty ?
              signUpPageController.selectCountryId.value : null,
              underline:const SizedBox.shrink(),
              hint:Row(
                children: const [

                  Expanded(child: Padding(padding: EdgeInsets.only(left: 25),
                      child:  Text("Select Country",
                          style: TextStyle(
                              color: levelTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal))
                  ))
                ],
              ),
              isExpanded: true,
              /// icon: SizedBox.shrink(),
              buttonPadding: const EdgeInsets.only(left: 0, right: 0),


              items: signUpPageController.countryDataList.map((list) {
                return DropdownMenuItem(
                  alignment: Alignment.centerLeft,



                  // value: list["id"].toString(),
                  value: list["name"].toString(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child:Padding(
                        padding: EdgeInsets.only(left: 25),
                        child:Text(
                            list["name"].toString(),
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
                String data= signUpPageController.selectCountryId(value.toString());
                //  _showToast("Id ="+checkoutPageController.selectStateId(value.toString()));
              },

            ))
        ),
      ],
    )
    ;
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


          String userAddressTxt = signUpPageController.userAddressController.value.text;
          String userCityTxt = signUpPageController.userCityController.value.text;
          String userStateTxt = signUpPageController.userStateController.value.text;

          String zipCodeTxt = signUpPageController.zipCodeController.value.text;
          String guardianNameTxt = signUpPageController.guardianNameController.value.text;
          String guardianPhoneTxt = signUpPageController.guardianPhoneController.value.text;
          String guardianEmailTxt = signUpPageController.guardianEmailController.value.text;
          String relationWithGuardianTxt = signUpPageController.relationWithGuardianNameController.value.text;

          if ( signUpPageController.inputValid(
              userNameTxt: userNameTxt,
              userEmailTxt: userEmailTxt,
              userPhoneTxt: userPhoneTxt,
              passwordTxt: passwordTxt,
              confirmPasswordTxt: confirmPasswordTxt,
              userDateOfBirthTxt: signUpPageController.userBirthDate.value,
              userAgeGradeTxt: signUpPageController.selectGradeId.value,
              addressTxt: userAddressTxt, cityTxt: userCityTxt,
              stateTxt: userStateTxt, zipCodeTxt: zipCodeTxt,
              guardianNameTxt:guardianNameTxt, relationWithGuardianTxt: relationWithGuardianTxt,
              guardianPhoneTxt: guardianPhoneTxt, guardianEmailTxt: guardianEmailTxt,
              selectedCountryTxt: signUpPageController.selectCountryId.value
          )== false) {

            if(signUpPageController.selectGradeId.value=="above/adult"){

              signUpPageController.userSignUp(
                  name: userNameTxt,
                  grade:signUpPageController.selectGradeId.value,
                  date_of_birth: signUpPageController.userBirthDate.value,
                  email: userEmailTxt,
                  phone: userPhoneTxt,
                  password: confirmPasswordTxt,
                  address: userAddressTxt, city: userCityTxt,
                  state: userStateTxt, zip: zipCodeTxt,
                  country: signUpPageController.selectCountryId.value,
                  guardian: "",
                  relationWithGuardian: "", guardianPhone: "",
                  guardianEmail: "");

            }else{

              signUpPageController.userSignUp(
                  name: userNameTxt,
                  grade:signUpPageController.selectGradeId.value,
                  date_of_birth: signUpPageController.userBirthDate.value,
                  email: userEmailTxt,
                  phone: userPhoneTxt,
                  password: confirmPasswordTxt,
                  address: userAddressTxt, city: userCityTxt,
                  state: userStateTxt, zip: zipCodeTxt,
                  country: signUpPageController.selectCountryId.value, guardian: guardianNameTxt,
                  relationWithGuardian: relationWithGuardianTxt, guardianPhone: guardianPhoneTxt,
                  guardianEmail: guardianEmailTxt);
            }





            //  LogInApiService().userLogIn(email: userEmailTxt, password: passwordTxt);

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


