
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../controller/payment-request_page_controller.dart';



class PaymentRequestScreen  extends StatelessWidget {

  final paymentRequestPageController = Get.put(PaymentRequestPageController());
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
          return _buildBodyDesign();
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
              child: Flex(direction: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20,right: 20),
                    child: InkResponse(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                  Text(
                    "Payment Request",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:1,
                  )
                ],
              )


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


                  SizedBox(height: 20,),


                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Payment Method",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userPaymentMethodSelect(),



                  //Account Number
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Account Number",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( paymentRequestPageController.accountNumberController.value, 'Account Number', TextInputType.text),


                  //Account Name
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Account Name",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInput( paymentRequestPageController.accountNameController.value, 'Account Name', TextInputType.text),

                  //Amount
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Amount",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputAmount( paymentRequestPageController.amountController.value, 'Amount', TextInputType.number),



                  //Note
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Note",
                        style: TextStyle(
                            color: levelTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userInputNote( paymentRequestPageController.noteController.value, 'Note', TextInputType.text),



                  const SizedBox(
                    height: 10,
                  ),
                  _buildSendButton(),
                  const SizedBox(
                    height: 10,
                  ),


                ],
              ),
            )

        ));
  }

  Widget userInput(TextEditingController userInputController,
      String hintTitle, TextInputType keyboardType) {
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

  Widget userInputAmount(TextEditingController userInputController, String hintTitle,
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
          style: const TextStyle(
              color: Colors.white
          ),
          autofocus: false,
          keyboardType: keyboardType,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegExp(r'[0-9]'),
            ),
            FilteringTextInputFormatter.deny(
              RegExp(
                  r'^0+'), //users can't type 0 at 1st position
            ),
          ],
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


        ),
      ),
    );
  }

  Widget userInputNote(TextEditingController userInputController, String hintTitle,
      TextInputType keyboardType) {
    return Container(

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
          textInputAction: TextInputAction.newline,
          // maxLines: 5,
          // minLines: 3,


          cursorColor: Colors.white,
          style: TextStyle(
              color: Colors.white
          ),

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

  Widget userPaymentMethodSelect() {
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
              value: paymentRequestPageController.selectPaymentMethodId.value != null &&
                  paymentRequestPageController.selectPaymentMethodId.value.isNotEmpty ?
              paymentRequestPageController.selectPaymentMethodId.value : null,
              underline:const SizedBox.shrink(),
              hint:Row(
                children: const [

                  Expanded(child: Padding(padding: EdgeInsets.only(left: 25),
                      child:  Text("Select Payment Method",
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


              items: paymentRequestPageController.paymentMethodList.map((list) {
                return DropdownMenuItem(
                  alignment: Alignment.centerLeft,



                  // value: list["id"].toString(),
                  value: list.paymentmethodName.toString(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child:Padding(
                        padding: EdgeInsets.only(left: 25),
                        child:Text(
                            list.paymentmethodName,
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
                String data= paymentRequestPageController.selectPaymentMethodId(value.toString());
                //  _showToast("Id ="+checkoutPageController.selectStateId(value.toString()));
              },

            ))
        ),
      ],
    )
    ;
  }

  Widget _buildSendButton() {
    return Container(
      margin: const EdgeInsets.only(left: 00.0, right: 00.0),
      child: ElevatedButton(
        onPressed: () {


          String accountNumberTxt = paymentRequestPageController.accountNumberController.value.text;
          String accountNameTxt = paymentRequestPageController.accountNameController.value.text;
          String amountTxt = paymentRequestPageController.amountController.value.text;
          String noteTxt = paymentRequestPageController.noteController.value.text;


          if ( paymentRequestPageController.inputValid(
              paymentMethod: paymentRequestPageController.selectPaymentMethodId.value,
              accountNumber: accountNumberTxt,
              accountName: accountNameTxt,
              amount: amountTxt,
              note: noteTxt

          )== false) {

            paymentRequestPageController.paymentRequest(
                token: paymentRequestPageController.userToken.value,
                payment_method: paymentRequestPageController.selectPaymentMethodId.value,
                account_number:accountNumberTxt, account_name: accountNameTxt,
                amount: amountTxt, note: noteTxt
            );

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

}


