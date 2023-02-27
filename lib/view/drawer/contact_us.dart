import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api_service/api_service.dart';

import '../../controller/dash_board_page_controller.dart';
import '../../controller/drawer_controller/contact_us_controller.dart';
import '../../controller/drawer_controller/faq_controller.dart';
import '../../controller/drawer_controller/privacy_policy_controller.dart';

import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';

import '../../static/Colors.dart';

import '../common/login_warning.dart';
import '../common/toast.dart';
import '../home_page/dash_board_page.dart';

class ContactUsPage extends StatelessWidget {
  var width;
  var height;
  final contactUsController = Get.put(ContactUsController());


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  Expanded(child:Text(
                    "ABOUT US",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:1,
                  ),),

                  Container(
                    margin: EdgeInsets.only(top: 0,right: 20),
                    child: InkWell(
                        onTap: (){
                          Get.deleteAll();
                          Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
                        },
                        child: Icon(
                          Icons.home,
                          size: 25,
                          color: Colors.white,
                        )
                    ),
                  ),



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
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
            width: Get.size.width,
            padding: EdgeInsets.only(
                left: 14,right: 15,
                top: 20
            ),
            decoration:  const BoxDecoration(
              color: bottom_bg_color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child:Column(
              children: [
                Expanded(child:
                SingleChildScrollView(
                    child:Column(
                      children: [


                       Row(
                         children: [
                           Expanded(child:  Container(
                             decoration: BoxDecoration(
                                 border: Border.all(color: smallTextColor,)
                             ),
                             margin:const EdgeInsets.only(left:0, top: 00, right: 0, bottom: 10   ),
                             padding: EdgeInsets.only(left:15, top: 15, right: 15, bottom: 15   ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,

                               children: [
                                 Text(
                                   "Quick Contact",
                                   overflow: TextOverflow.ellipsis,
                                   softWrap: false,
                                   maxLines: 1,
                                   style: TextStyle(
                                       color:recentTextColor,
                                       fontSize: 18,
                                       decoration: TextDecoration.none,
                                       fontWeight: FontWeight.w700),
                                 ),
                                SizedBox(height: 15,),

                                Row(
                                 // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => Text(
                                      contactUsController.companyName.value,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color:textColor,
                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500),
                                    ),)

                                  ],
                                ),
                                 SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tel:",
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color:textColor,

                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Expanded(child:  Obx(() => Text(
                                      contactUsController.telephone.value,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines:1,
                                      style: TextStyle(
                                          color:forgottenPasswordTextColor,
                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500),
                                    )),)
                                  ],
                                ),
                                 SizedBox(height: 5,),
                                Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(
                                       "Cell:",
                                       overflow: TextOverflow.ellipsis,
                                       softWrap: false,
                                       maxLines: 1,
                                       style: TextStyle(
                                           color:textColor,

                                           fontSize: 15,
                                           decoration: TextDecoration.none,
                                           fontWeight: FontWeight.w500),
                                     ),
                                     Expanded(child:  Obx(() => Text(
                                       contactUsController.cellphone.value,
                                       overflow: TextOverflow.ellipsis,
                                       softWrap: false,
                                       maxLines:1,
                                       style: TextStyle(
                                           color:forgottenPasswordTextColor,
                                           fontSize: 15,
                                           decoration: TextDecoration.none,
                                           fontWeight: FontWeight.w500),
                                     )),)
                                   ],
                                 ),
                                 SizedBox(height: 5,),
                                Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(
                                       "Email:",
                                       overflow: TextOverflow.ellipsis,
                                       softWrap: false,
                                       maxLines: 1,
                                       style: TextStyle(
                                           color:textColor,

                                           fontSize: 15,
                                           decoration: TextDecoration.none,
                                           fontWeight: FontWeight.w500),
                                     ),
                                     Expanded(child:  Obx(() => Text(
                                       contactUsController.emailAddress.value,
                                       overflow: TextOverflow.ellipsis,
                                       softWrap: false,
                                       maxLines:1,
                                       style: TextStyle(
                                           color:forgottenPasswordTextColor,
                                           fontSize: 15,
                                           decoration: TextDecoration.none,
                                           fontWeight: FontWeight.w500),
                                     )),)
                                   ],
                                 ),

                                 SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(child:  Obx(() => Text(
                                      contactUsController.address.value,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines:2,
                                      style: TextStyle(
                                          color:textColor,
                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w500),
                                    )),)
                                  ],
                                ),





                               ],
                             ),
                           ),)
                         ],
                       ),

                        Row(
                          children: [
                            Expanded(child:  Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: smallTextColor,)
                              ),
                              margin:const EdgeInsets.only(left:0, top: 00, right: 0, bottom: 10   ),
                              padding: EdgeInsets.only(left:15, top: 15, right: 15, bottom: 15   ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [


                                  Text(
                                    "More Information",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color:recentTextColor,
                                        fontSize: 18,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 0,left: 10),
                                        child: InkWell(
                                          onTap: (){
                                            _launchUrl(
                                                contactUsController.faceBookLink.value
                                            );

                                          },
                                          child: Image.asset(
                                            "assets/images/facebook.png",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 0, bottom: 0,left: 10),
                                        child: InkWell(
                                          onTap: (){
                                            _launchUrl(

                                                contactUsController.youtubeLink.value

                                            );

                                          },
                                          child: Image.asset(
                                            "assets/images/twitter.png",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 0, bottom: 0,left: 10),
                                        child: InkWell(
                                          onTap: (){
                                            _launchUrl(

                                            contactUsController.instagramLink.value

                                            );

                                          },
                                          child: Image.asset(
                                            "assets/images/youtube.png",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 0, bottom: 0,left: 10),
                                        child: InkWell(
                                          onTap: (){
                                            _launchUrl(

                                            contactUsController.twitterLink.value
                                            );

                                          },
                                          child: Image.asset(
                                            "assets/images/instagram.png",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                            ),)
                          ],
                        ),

                        SizedBox(height: 20,),
                        Text(
                          "HAVE ANY QUESTIONS? SEND MESSAGE US",
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(
                              color:recentTextColor,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),


                        SizedBox(height: 20,),



                        userInput(
                            userInputController: contactUsController.userNameController.value,
                            hintTitle: 'Full Name', keyboardType:TextInputType.text,
                           // iconData: Icons.person
                        ),
                        SizedBox(height: 10,),
                        userInput(
                            userInputController: contactUsController.userPhoneController.value,
                            hintTitle: 'Phone', keyboardType:TextInputType.text,
                         //   iconData: Icons.person
                        ),
                        SizedBox(height: 10,),
                        userInput(
                            userInputController: contactUsController.userEmailController.value,
                            hintTitle: 'Email', keyboardType:TextInputType.text,
                           // iconData: Icons.person
                        ),
                        SizedBox(height: 10,),
                        userInput(
                            userInputController: contactUsController.subjectController.value,
                            hintTitle: "Subject", keyboardType:TextInputType.text,
                           // iconData: Icons.person
                        ),
                        SizedBox(height: 10,),
                        userInput(
                            userInputController: contactUsController.messageController.value,
                            hintTitle: 'Message', keyboardType:TextInputType.text,
                         //   iconData: Icons.person
                        ),

                        SizedBox(height: 25,),
                        _buildSendMessageButton(),




                      ],
                    )
                )
                ),
              ],
            ))
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


  //login button create
  Widget _buildSendMessageButton() {
    return ElevatedButton(
      onPressed: () {

        String userNameTxt = contactUsController.userNameController.value.text;
        String userEmailTxt = contactUsController.userEmailController.value.text;
        String messageTxt = contactUsController.messageController.value.text;

        if(userNameTxt.isEmpty){
          showToastShort("Name can't Empty!");
          return;

        }
        if(userEmailTxt.isEmpty){
          showToastShort("Email can't Empty!");
          return;

        }
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
          //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
        )
            .hasMatch(userEmailTxt)) {
          Fluttertoast.cancel();
          showToastShort("Enter valid email!");
          return;
        }
        if(messageTxt.isEmpty){
          showToastShort("Message can't Empty!");
          return;

        }

        contactUsController. contactUsMessageSend(name: userNameTxt, email: userEmailTxt, message: messageTxt);



      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [button_bg_color,button_bg_color],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: Container(

          height: 50,
          alignment: Alignment.center,
          child:  const Text(
            "Send Message",
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
    );
  }


  Future<void> _launchUrl(String urlLink) async {
    final Uri _url = Uri.parse(urlLink);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}

