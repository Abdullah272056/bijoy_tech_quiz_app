
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

class RegistrationScreen2  extends StatelessWidget {

  final signUpPageController = Get.put(SignUpPageController2());
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
              //width: 50,
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



                  //Address
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Address",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.userAddressController.value, 'Address', TextInputType.text),


                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("City",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.userCityController.value, 'City', TextInputType.text),

                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("State",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.userStateController.value, 'State', TextInputType.text),


                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Zip",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.zipCodeController.value, 'Zip', TextInputType.text),

                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Country",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userCountrySelect(),

                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Guardian Name",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.guardianNameController.value, 'Guardian Name', TextInputType.text),



                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Relation with Guardian",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.relationWithGuardianNameController.value, 'Relation with Guardian', TextInputType.text),



                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Guardian Phone",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.guardianPhoneController.value, 'Guardian Phone', TextInputType.text),


                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Guardian Email",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( signUpPageController.guardianEmailController.value, 'Guardian Email', TextInputType.text),


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

  Widget userInput(TextEditingController userInputController, String hintTitle,
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
            // suffixIcon: Icon(Icons.person,
            //   color:  levelTextColorWhite,
            //   size: 18,
            // ),


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


  Widget userCountrySelect() {
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
                              color: hint_color,
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

          String userAddressTxt = signUpPageController.userAddressController.value.text;
          String userCityTxt = signUpPageController.userCityController.value.text;
          String userStateTxt = signUpPageController.userStateController.value.text;

          String zipCodeTxt = signUpPageController.zipCodeController.value.text;
          String guardianNameTxt = signUpPageController.guardianNameController.value.text;
          String guardianPhoneTxt = signUpPageController.guardianPhoneController.value.text;
          String guardianEmailTxt = signUpPageController.guardianEmailController.value.text;
          String relationWithGuardianTxt = signUpPageController.relationWithGuardianNameController.value.text;

          if ( signUpPageController.inputValid(
              addressTxt: userAddressTxt, cityTxt: userCityTxt,
              stateTxt: userStateTxt, zipCodeTxt: zipCodeTxt,
              guardianNameTxt:guardianNameTxt, relationWithGuardianTxt: relationWithGuardianTxt,
              guardianPhoneTxt: guardianPhoneTxt, guardianEmailTxt: guardianEmailTxt,
              selectedCountryTxt: signUpPageController.selectCountryId.value
          )== false) {

            signUpPageController.userSignUp(
                name: signUpPageController.userNameTxt.value, grade:signUpPageController.userAgeGradeTxt.value,
                date_of_birth: signUpPageController.userDateOfBirthTxt.value, email: signUpPageController.userEmailTxt.value,
                phone: signUpPageController.userPhoneTxt.value, password: signUpPageController.confirmPasswordTxt.value,
                address: userAddressTxt, city: userCityTxt,
                state: userStateTxt, zip: zipCodeTxt,
                country: signUpPageController.selectCountryId.value, guardian: guardianNameTxt,
                relationWithGuardian: relationWithGuardianTxt, guardianPhone: guardianPhoneTxt,
                guardianEmail: guardianEmailTxt);





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


