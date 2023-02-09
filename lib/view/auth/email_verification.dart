
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../controller/email_verification_page_controller.dart';
import '../common/toast.dart';

class EmailVerificationScreen extends StatelessWidget {

final emailVerifyPageController = Get.put(EmailVerifyPageController());

  var width;
  var height;
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor:  bg_top_color,
          body: LayoutBuilder(builder: (context,constraints){

            if(constraints.maxWidth<600){
              return _buildBodyDesign(width);
            }
            else{
              return _buildBodyDesign(550);

            }

          },)




      ),
    );

    // return Scaffold(
    //   backgroundColor:Colors.white ,
    //   body:CustomScrollView(
    //     slivers: [
    //       SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Column(
    //
    //
    //           children: [
    //             Expanded(child:Column(
    //               children: [
    //                 const SizedBox(
    //                   height: 55,
    //                 ),
    //                 Padding(
    //                     padding:
    //                     const EdgeInsets.only(left:20, top: 10, right: 20, bottom: 30),
    //                     child: Column(
    //                       children: [
    //
    //                         const SizedBox(
    //                           height: 40,
    //                         ),
    //
    //                         Image.asset(
    //                           "assets/images/fnf_logo.png",
    //                           width: 158,
    //                           height: 70,
    //                           fit: BoxFit.fill,
    //                         ),
    //
    //                         Container(
    //                           margin:const EdgeInsets.only(right: 20.0,top: 00,left: 10,bottom: 0),
    //                           child: const Align(alignment: Alignment.topCenter,
    //                             child: Text(
    //                               "Please enter the verification code, was send to your email",
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                   color: fnf_small_color,
    //                                   fontSize: 15,
    //                                   fontWeight: FontWeight.w400),
    //                             ),),
    //                         ),
    //
    //                         // if(_isCountingStatus==false)...[
    //                         //   Container(
    //                         //     margin:const EdgeInsets.only(right: 20.0,top: 20,left: 10,bottom: 0),
    //                         //     child: Align(alignment: Alignment.topCenter,
    //                         //       child: Text(
    //                         //         _startTxt,
    //                         //         textAlign: TextAlign.center,
    //                         //         style: const TextStyle(
    //                         //             color: fnf_color,
    //                         //             fontSize: 18,
    //                         //             fontWeight: FontWeight.w400),
    //                         //       ),),
    //                         //   ),
    //                         // ]
    //                         // else...[
    //                         //   Container(
    //                         //     margin:const EdgeInsets.only(right: 20.0,top: 15,left: 10,bottom: 0),
    //                         //     child: Align(alignment: Alignment.topCenter,
    //                         //       child: InkResponse(
    //                         //         onTap: (){
    //                         //
    //                         //          // _userSendCodeWithEmail();
    //                         //
    //                         //         },
    //                         //         child: const Text(
    //                         //           "Resend Code",
    //                         //           textAlign: TextAlign.center,
    //                         //           style: TextStyle(
    //                         //               color: hint_color,
    //                         //               fontSize: 15,
    //                         //               fontWeight: FontWeight.w400),
    //                         //         ),
    //                         //       ),),
    //                         //   ),
    //                         // ],
    //
    //
    //                         Container(
    //                           margin:const EdgeInsets.only(right: 20.0,top: 15,left: 10,bottom: 0),
    //                           child: Align(alignment: Alignment.topCenter,
    //                             child: InkResponse(
    //                               onTap: (){
    //
    //                                 // _userSendCodeWithEmail();
    //
    //                               },
    //                               child: const Text(
    //                                 "Resend Code",
    //                                 textAlign: TextAlign.center,
    //                                 style: TextStyle(
    //                                     color: fnf_color,
    //                                     fontSize: 15,
    //                                     fontWeight: FontWeight.w500),
    //                               ),
    //                             ),),
    //                         ),
    //
    //
    //                         const SizedBox(
    //                           height: 30,
    //                         ),
    //                         _buildTextFieldOTPView1(),
    //
    //
    //                       ],
    //                     )),
    //                 Expanded(child:  Align(alignment: Alignment.bottomCenter,
    //                   child: _buildBottomDesign(),
    //                 ),)
    //
    //
    //               ],
    //             )),
    //
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    //
    //
    // );
  }

  Widget _buildBodyDesign(double otpBoxLength) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(


            children: [
              Expanded(child:Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Padding(
                      padding:
                      const EdgeInsets.only(left:20, top: 10, right: 20, bottom: 30),
                      child: Column(
                        children: [

                          const SizedBox(
                            height: 40,
                          ),

                          Image.asset(
                            "assets/images/verified.webp",
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                            color: forgottenPasswordTextColor,
                          ),

                          Container(
                            margin:const EdgeInsets.only(right: 10.0,top: 10,left: 10,bottom: 0),
                            child: const Align(alignment: Alignment.center,
                              child: Text(
                                "OTP Verified",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:textColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),

                          Container(
                            margin:const EdgeInsets.only(right: 20.0,top: 00,left: 10,bottom: 0),
                            child: const Align(alignment: Alignment.topCenter,
                              child: Text(
                                "Please enter the verification code, was send to your email",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: smallTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),),
                          ),

                          // if(_isCountingStatus==false)...[
                          //   Container(
                          //     margin:const EdgeInsets.only(right: 20.0,top: 20,left: 10,bottom: 0),
                          //     child: Align(alignment: Alignment.topCenter,
                          //       child: Text(
                          //         _startTxt,
                          //         textAlign: TextAlign.center,
                          //         style: const TextStyle(
                          //             color: fnf_color,
                          //             fontSize: 18,
                          //             fontWeight: FontWeight.w400),
                          //       ),),
                          //   ),
                          // ]
                          // else...[
                          //   Container(
                          //     margin:const EdgeInsets.only(right: 20.0,top: 15,left: 10,bottom: 0),
                          //     child: Align(alignment: Alignment.topCenter,
                          //       child: InkResponse(
                          //         onTap: (){
                          //
                          //          // _userSendCodeWithEmail();
                          //
                          //         },
                          //         child: const Text(
                          //           "Resend Code",
                          //           textAlign: TextAlign.center,
                          //           style: TextStyle(
                          //               color: hint_color,
                          //               fontSize: 15,
                          //               fontWeight: FontWeight.w400),
                          //         ),
                          //       ),),
                          //   ),
                          // ],

                          Container(
                            margin:const EdgeInsets.only(right: 20.0,top: 15,left: 10,bottom: 0),
                            child: Align(alignment: Alignment.topCenter,
                              child: InkResponse(
                                onTap: (){

                                  // _userSendCodeWithEmail();

                                },
                                child: const Text(
                                  "Resend Code",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: forgottenPasswordTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            width: otpBoxLength,
                            child:_buildTextFieldOTPView1(),
                          )

                        ],
                      )),
                  Expanded(child:  Align(alignment: Alignment.bottomCenter,
                    child: _buildBottomDesign(),
                  ),)


                ],
              )),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomDesign() {
    return Container(
        height: 300,
        width: double.infinity,
        decoration: const BoxDecoration(
          color:bottom_bg_color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),

          // boxShadow: [BoxShadow(
          //
          //     color:Colors.grey.withOpacity(.3),
          //     //  blurRadius: 20.0, // soften the shadow
          //     blurRadius:20, // soften the shadow
          //     spreadRadius: 0.0, //extend the shadow
          //     offset:const Offset(
          //       2.0, // Move to right 10  horizontally
          //       1.0, // Move to bottom 10 Vertically
          //     )
          // )],

        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 00, top: 15, right: 00, bottom: 0),
            child: Column(
              children: [

                Expanded(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Flex(direction: Axis.horizontal,
                          children: [

                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("1");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "1",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("2");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "2",
                                  textAlign: TextAlign.center,

                                  style:emailVerifyPageController. keyboardTextStyle,
                                ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("3");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "3",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),

                          ],
                        ),

                        Flex(direction: Axis.horizontal,
                          children: [
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("4");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "4",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("5");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "5",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("6");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "6",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),

                          ],
                        ),

                        Flex(direction: Axis.horizontal,
                          children: [
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("7");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "7",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("8");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "8",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("9");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "9",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),

                          ],
                        ),

                        Flex(direction: Axis.horizontal,
                          children: [
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("x");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 10, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child:Image.asset(
                                  'assets/images/icon_backspace.png',
                                  height: 20,
                                  width: 30,
                                  color: Colors.deepOrange,
                                ),
                                // Text(
                                //   "x",
                                //   textAlign: TextAlign.center,
                                //
                                //   style: keyboardTextStyle,
                                // ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){
                                typeKeyboard("0");
                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
                                child: Text(
                                  "0",
                                  textAlign: TextAlign.center,

                                  style: emailVerifyPageController.keyboardTextStyle,
                                ),
                              ),
                            ),),
                            Expanded(child:InkWell(
                              onTap: (){

                               // _showToast(emailVerifyPageController.userEmail.value);
                                if(emailVerifyPageController.inputText.value.length<6||emailVerifyPageController.inputText.value.length>6){

                                  showToastLong("Input six digit pin");

                                }
                                else{

                                  userVerify(
                                      email: emailVerifyPageController.userEmail.value,
                                      otp: emailVerifyPageController.inputText.value);


                               //   _showToast(emailVerifyPageController.userEmail.value);
                                  // userVerify(
                                  //     email: "abdullah272056@gmail.com",
                                  //     otp: emailVerifyPageController.inputText.value);
                                //  Get.to(PasswordSetScreen());

                                }

                              },
                              child: Container(
                                padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 10, bottom:emailVerifyPageController. keyboardfontBottomPadding),
                                child:Image.asset('assets/images/submit_icon.png',
                                  height: 30,
                                  width: 30,
                                  color: forgottenPasswordTextColor,

                                ),

                              ),
                            ),),



                          ],
                        ),

                      ],
                    )

                ),


                const SizedBox(height: 15,),

              ],
            )));
  }

  ///otp field box
  Widget _buildTextFieldOTPView1() {
    return
      Flex(direction: Axis.horizontal,
      children: [
        Expanded(child: Container(
          height: 55,
          decoration: BoxDecoration(
              color:otp_box_bg_color,
              borderRadius: BorderRadius.circular(6)),
          margin:const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
          padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
          child: Center(
            child:   Obx(() =>
                Text(
                  emailVerifyPageController.firstDigitPin.value,
                  textAlign: TextAlign.center,

                  style: emailVerifyPageController.otpInputBoxTextStyle,
                )
            )
            ,
          ),
        ),),
        Expanded(child: Container(
          height: 55,
          decoration: BoxDecoration(
              color:otp_box_bg_color,
              borderRadius: BorderRadius.circular(6)),
          margin:const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
          padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
          child:Center(
            child: Obx(() => Text(
              emailVerifyPageController.secondDigitPin.value,
              textAlign: TextAlign.center,

              style: emailVerifyPageController.otpInputBoxTextStyle,
            )),
          ),
        ),),
        Expanded(child: Container(
          height: 55,
          decoration: BoxDecoration(
              color:otp_box_bg_color,
              borderRadius: BorderRadius.circular(6)),
          margin:const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
          padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
          child: Center(
            child: Obx(() =>Text(
              emailVerifyPageController.thirdDigitPin.value,
              textAlign: TextAlign.center,

              style: emailVerifyPageController.otpInputBoxTextStyle,
            )),
          ),
        ),),
        Expanded(child: Container(
          height: 55,
          decoration: BoxDecoration(
              color:otp_box_bg_color,
              borderRadius: BorderRadius.circular(6)),
          margin:const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
          padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
          child: Center(
            child: Obx(() =>Text(
              emailVerifyPageController.fourthDigitPin.value,
              textAlign: TextAlign.center,

              style: emailVerifyPageController.otpInputBoxTextStyle,
            )),
          ),
        ),),
        Expanded(child: Container(
          height: 55,
          decoration: BoxDecoration(
              color:otp_box_bg_color,
              borderRadius: BorderRadius.circular(6)),
          margin:const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
          padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
          child: Center(
            child:Obx(() =>
                Text(
                  emailVerifyPageController.fifthDigitPin.value,
                  textAlign: TextAlign.center,

                  style: emailVerifyPageController.otpInputBoxTextStyle,
                )

            ),
          ),
        ),),
        Expanded(child: Container(
          height: 55,
          decoration: BoxDecoration(
              color:otp_box_bg_color,
              borderRadius: BorderRadius.circular(6)),
          margin:const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
          padding:EdgeInsets.only(left: 00, top: emailVerifyPageController.keyboardfontTopPadding, right: 00, bottom: emailVerifyPageController.keyboardfontBottomPadding),
          child: Center(child: Obx(() =>
          Text(
            emailVerifyPageController.sixthDigitPin.value,
            textAlign: TextAlign.center,

            style: emailVerifyPageController.otpInputBoxTextStyle,
          )),
          ),
        ),),

      ],
    );
  }

  ///input otp text combination
  void typeKeyboard(String typeKey) {
    if (typeKey == "x") {
      if (emailVerifyPageController.inputText.value.length > 1) {
        emailVerifyPageController.inputText(emailVerifyPageController.inputText.value.substring(0, emailVerifyPageController.inputText.value.length - 1));
        // inputText = emailVerifyPageController.inputText.value.substring(0, emailVerifyPageController.inputText.value.length - 1);
      } else {
        emailVerifyPageController.inputText("");
        // inputText = "";
      }
    }
    else {
      String abc = emailVerifyPageController.inputText.value + typeKey;
      if(abc.length<=6){
        emailVerifyPageController.inputText(emailVerifyPageController.inputText.value + typeKey);
        // inputText = emailVerifyPageController.inputText.value + typeKey;
      }

    }
    setText(emailVerifyPageController.inputText.value);
  }

  ///input text set in text box
  void setText(String inputText){

    if(inputText.isEmpty){
      emailVerifyPageController.firstDigitPin("-");
      emailVerifyPageController.secondDigitPin("-");
      emailVerifyPageController.thirdDigitPin("-");
      emailVerifyPageController.fourthDigitPin("-");
      emailVerifyPageController.fifthDigitPin("-");
      emailVerifyPageController.sixthDigitPin("-");
      return;
    }
    if(inputText.length==1){
      emailVerifyPageController.firstDigitPin(inputText[0].toString());
      emailVerifyPageController.secondDigitPin("-");
      emailVerifyPageController.thirdDigitPin("-");
      emailVerifyPageController.fourthDigitPin("-");
      emailVerifyPageController.fifthDigitPin("-");
      emailVerifyPageController.sixthDigitPin("-");
      return;
    }
    if(inputText.length==2){
      emailVerifyPageController.firstDigitPin(inputText[0].toString());
      emailVerifyPageController.secondDigitPin(inputText[1].toString());
      emailVerifyPageController.thirdDigitPin("-");
      emailVerifyPageController.fourthDigitPin("-");
      emailVerifyPageController.fifthDigitPin("-");
      emailVerifyPageController.sixthDigitPin("-");
      return;
    }
    if(inputText.length==3){
      emailVerifyPageController.firstDigitPin(inputText[0].toString());
      emailVerifyPageController.secondDigitPin(inputText[1].toString());
      emailVerifyPageController.thirdDigitPin(inputText[2].toString());
      emailVerifyPageController.fourthDigitPin("-");
      emailVerifyPageController.fifthDigitPin("-");
      emailVerifyPageController.sixthDigitPin("-");
      return;
    }
    if(inputText.length==4){
      emailVerifyPageController.firstDigitPin(inputText[0].toString());
      emailVerifyPageController.secondDigitPin(inputText[1].toString());
      emailVerifyPageController.thirdDigitPin(inputText[2].toString());
      emailVerifyPageController.fourthDigitPin(inputText[3].toString());
      emailVerifyPageController.fifthDigitPin("-");
      emailVerifyPageController.sixthDigitPin("-");
      return;
    }
    if(inputText.length==5){
      emailVerifyPageController.firstDigitPin(inputText[0].toString());
      emailVerifyPageController.secondDigitPin(inputText[1].toString());
      emailVerifyPageController.thirdDigitPin(inputText[2].toString());
      emailVerifyPageController.fourthDigitPin(inputText[3].toString());
      emailVerifyPageController.fifthDigitPin(inputText[4].toString());
      emailVerifyPageController.sixthDigitPin("-");

      return;
    }
    if(inputText.length==6){
      emailVerifyPageController.firstDigitPin(inputText[0].toString());
      emailVerifyPageController.secondDigitPin(inputText[1].toString());
      emailVerifyPageController.thirdDigitPin(inputText[2].toString());
      emailVerifyPageController.fourthDigitPin(inputText[3].toString());
      emailVerifyPageController.fifthDigitPin(inputText[4].toString());
      emailVerifyPageController.sixthDigitPin(inputText[5].toString());

      return;

    }

  }

  ///input otp text combination
  void typeKeyboard1(String typeKey) {
    // setState(() {
    //   if (typeKey == "x") {
    //     if (emailVerifyPageController.inputText.value.length > 1) {
    //       emailVerifyPageController.inputText(emailVerifyPageController.inputText.value.substring(0, emailVerifyPageController.inputText.value.length - 1));
    //       // inputText = emailVerifyPageController.inputText.value.substring(0, emailVerifyPageController.inputText.value.length - 1);
    //     } else {
    //       emailVerifyPageController.inputText("");
    //       // inputText = "";
    //     }
    //   }
    //   else {
    //     String abc = emailVerifyPageController.inputText.value + typeKey;
    //     if(abc.length<=6){
    //       emailVerifyPageController.inputText(emailVerifyPageController.inputText.value + typeKey);
    //       // inputText = emailVerifyPageController.inputText.value + typeKey;
    //     }
    //
    //   }
    //   setText(emailVerifyPageController.inputText.value);
    // });
  }

  ///input text set in text box
  void setText1(String inputText){
    // setState(() {
    //   if(inputText.isEmpty){
    //     emailVerifyPageController.firstDigitPin("-");
    //     emailVerifyPageController.secondDigitPin("-");
    //     emailVerifyPageController.thirdDigitPin("-");
    //     emailVerifyPageController.fourthDigitPin("-");
    //     emailVerifyPageController.fifthDigitPin("-");
    //     emailVerifyPageController.sixthDigitPin("-");
    //     return;
    //   }
    //   if(inputText.length==1){
    //     emailVerifyPageController.firstDigitPin(inputText[0].toString());
    //     emailVerifyPageController.secondDigitPin("-");
    //     emailVerifyPageController.thirdDigitPin("-");
    //     emailVerifyPageController.fourthDigitPin("-");
    //     emailVerifyPageController.fifthDigitPin("-");
    //     emailVerifyPageController.sixthDigitPin("-");
    //     return;
    //   }
    //   if(inputText.length==2){
    //     emailVerifyPageController.firstDigitPin(inputText[0].toString());
    //     emailVerifyPageController.secondDigitPin(inputText[1].toString());
    //     emailVerifyPageController.thirdDigitPin("-");
    //     emailVerifyPageController.fourthDigitPin("-");
    //     emailVerifyPageController.fifthDigitPin("-");
    //     emailVerifyPageController.sixthDigitPin("-");
    //     return;
    //   }
    //   if(inputText.length==3){
    //     emailVerifyPageController.firstDigitPin(inputText[0].toString());
    //     emailVerifyPageController.secondDigitPin(inputText[1].toString());
    //     emailVerifyPageController.thirdDigitPin(inputText[2].toString());
    //     emailVerifyPageController.fourthDigitPin("-");
    //     emailVerifyPageController.fifthDigitPin("-");
    //     emailVerifyPageController.sixthDigitPin("-");
    //     return;
    //   }
    //   if(inputText.length==4){
    //     emailVerifyPageController.firstDigitPin(inputText[0].toString());
    //     emailVerifyPageController.secondDigitPin(inputText[1].toString());
    //     emailVerifyPageController.thirdDigitPin(inputText[2].toString());
    //     emailVerifyPageController.fourthDigitPin(inputText[3].toString());
    //     emailVerifyPageController.fifthDigitPin("-");
    //     emailVerifyPageController.sixthDigitPin("-");
    //     return;
    //   }
    //   if(inputText.length==5){
    //     emailVerifyPageController.firstDigitPin(inputText[0].toString());
    //     emailVerifyPageController.secondDigitPin(inputText[1].toString());
    //     emailVerifyPageController.thirdDigitPin(inputText[2].toString());
    //     emailVerifyPageController.fourthDigitPin(inputText[3].toString());
    //     emailVerifyPageController.fifthDigitPin(inputText[4].toString());
    //     emailVerifyPageController.sixthDigitPin("-");
    //
    //     return;
    //   }
    //   if(inputText.length==6){
    //     emailVerifyPageController.firstDigitPin(inputText[0].toString());
    //     emailVerifyPageController.secondDigitPin(inputText[1].toString());
    //     emailVerifyPageController.thirdDigitPin(inputText[2].toString());
    //     emailVerifyPageController.fourthDigitPin(inputText[3].toString());
    //     emailVerifyPageController.fifthDigitPin(inputText[4].toString());
    //     emailVerifyPageController.sixthDigitPin(inputText[5].toString());
    //
    //     return;
    //
    //   }
    //
    // });
  }

  userVerify({
    required String email,
    required String otp,
  }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //   try {
      //
      //     showLoadingDialog("Checking");
      //
      //     var response = await http.post(Uri.parse('$BASE_URL_API$SUB_URL_API_SEND_OTP'),
      //     //     var response = await http.post(Uri.parse('http://192.168.68.106/bijoytech_ecomerce/api/reset-otp-check'),
      //         body: {
      //           'email': email,
      //           'otp': otp
      //         }
      //     );
      //     Get.back();
      //   //  _showToast(response.statusCode.toString());
      //     if (response.statusCode == 200) {
      //
      //       Get.to(() => PasswordSetScreen(), arguments: [
      //         {"email": email},
      //         {"otp": otp}
      //       ]);
      //     //  Get.to(PasswordSetScreen());
      //
      //     }
      //
      //     else {
      //       // Get.back();
      //       var data = jsonDecode(response.body);
      //       showToastLong("Otp Invalid!");
      //     }
      //
      //
      //   } catch (e) {
      //     //  Navigator.of(context).pop();
      //     //print(e.toString());
      //   } finally {
      //     // Get.back();
      //
      //     /// Navigator.of(context).pop();
      //   }
      // }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      showToastLong("No Internet Connection!");
    }
  }

  //loading dialog crete
  void showLoadingDialog(String message) {

    Get.defaultDialog(
        title: '',
        titleStyle: TextStyle(fontSize: 0),
        // backgroundColor: Colors.white.withOpacity(.8),
        content: Wrap(
          children: [
            Container(
              alignment: Alignment.center,
              // margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 20),
              child:Column(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height:50,
                    width: 50,
                    margin: EdgeInsets.only(top: 10),
                    child: CircularProgressIndicator(
                      backgroundColor: awsStartColor,
                      color: awsEndColor,
                      strokeWidth: 6,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child:Text(
                      message,
                      style: const TextStyle(fontSize: 25,),
                    ),
                  ),

                ],
              ),
            )
          ],
          // child: VerificationScreen(),
        ),
        barrierDismissible: false,
        radius: 10.0);

  }



}

