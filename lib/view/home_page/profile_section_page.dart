
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../api_service/api_service.dart';

import '../../controller/change_password_page_controller.dart';
import '../../controller/dash_board_page_controller.dart';

import '../../controller/my_profile_page_controller.dart';
import '../../controller/my_quiz_score_controller.dart';
import '../../controller/payment-request_page_controller.dart';
import '../../controller/profile_section_page_controller.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';

import '../../../static/Colors.dart';


import '../auth/change_password_page.dart';
import '../auth/fotget_password_page.dart';
import '../auth/log_in_page.dart';
import '../auth/registration_page.dart';
import '../common/login_warning.dart';

import '../custom_drawer.dart';
import '../payment_request_page.dart';
import 'MyQuizScorePage.dart';
import 'dash_board_page.dart';
import 'my_profile_page.dart';



class ProfileSectionPage extends StatelessWidget {
  final profileSectionPageController = Get.put(ProfileSectionPageController());
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {

        Get.deleteAll();
        Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
        return true;

      },
      child: SafeArea(

        child: Scaffold(
            backgroundColor: backGroundColor,
            key: _drawerKey,
            drawer: CustomDrawer(),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return _buildBodyDesign();
              },
            )),
      ),


      // Scaffold(
      //     body:Container(
      //         decoration: BoxDecoration(
      //           color:fnf_title_bar_bg_color,
      //         ),
      //         child: Column(
      //           // mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height / 16,
      //               // height: 50,
      //             ),
      //             Flex(direction: Axis.horizontal,
      //               children: [
      //                 SizedBox(width: 15,),
      //                 // IconButton(
      //                 //   iconSize: 20,
      //                 //   icon:Icon(
      //                 //     Icons.arrow_back_ios_new,
      //                 //     color: Colors.white,
      //                 //   ),
      //                 //   onPressed: () {
      //                 //     Get.back();
      //                 //   },
      //                 // ),
      //                 SizedBox(width: 5,),
      //                 Expanded(child: Text(
      //                   "PROFILE SECTION",
      //                   style: TextStyle(color: Colors.white,
      //                       fontWeight: FontWeight.w500,
      //                       fontSize: 16
      //                   ),
      //                 )),
      //
      //
      //               ],
      //             ),
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height / 35,
      //               // height: 50,
      //             ),
      //             //SizedBox(height: 10,),
      //             Expanded(child: Container(
      //               color: Colors.white,
      //
      //               child: SingleChildScrollView(
      //                 child: Column(
      //                   children: [
      //
      //                     SizedBox(height: 10,),
      //
      //                     if(profileSectionPageController.userToken.isNotEmpty &&
      //                         profileSectionPageController.userToken.value!=null&&
      //                         profileSectionPageController.userToken.value!="null")...{
      //
      //                       Row(
      //                         children: [
      //                           _buildCardItem(
      //                             item_marginLeft: 20,
      //                             item_marginRight: 10,
      //                             name: "MY ORDERS",
      //                             imageLink: 'assets/images/orders.png',
      //                             onClick: 1,),
      //
      //                           _buildCardItem(
      //                             item_marginLeft: 10,
      //                             item_marginRight: 20,
      //                             name: "BILLING ADDRESS",
      //                             imageLink: 'assets/images/icon_address.png',
      //                             onClick: 2,),
      //
      //                         ],
      //                       ),
      //
      //                       Row(
      //                         children: [
      //                           _buildCardItem(
      //                             item_marginLeft: 20,
      //                             item_marginRight: 10,
      //                             name: "ACCOUNT DETAILS ",
      //                             imageLink: 'assets/images/icon_account.png',
      //                             onClick: 3,),
      //                           _buildCardItem(
      //                             item_marginLeft: 10,
      //                             item_marginRight: 20,
      //                             name: "WISHLIST",
      //                             imageLink: 'assets/images/icon_love.png',
      //                             onClick: 4,),
      //
      //                         ],
      //                       ),
      //                       Row(
      //                         children: [
      //                           _buildCardItem(
      //                             item_marginLeft: 20,
      //                             item_marginRight: 10,
      //                             name: "CHANGE PASSWORD",
      //                             imageLink: 'assets/images/change_password.png',
      //                             onClick: 5,),
      //
      //                           _buildCardItem(
      //                             item_marginLeft: 10,
      //                             item_marginRight: 20,
      //                             name: "LOGOUT",
      //                             imageLink: 'assets/images/icon_logout.png',
      //                             onClick: 6,),
      //
      //
      //
      //                         ],
      //                       )
      //                     }
      //                     else...{
      //
      //                       Row(
      //                         children: [
      //                           _buildCardItem(
      //                             item_marginLeft: 20,
      //                             item_marginRight: 10,
      //                             name: "SIGN IN",
      //                             imageLink: 'assets/images/icon_log_in_account.png',
      //                             onClick: 11,),
      //
      //                           _buildCardItem(
      //                             item_marginLeft: 10,
      //                             item_marginRight: 20,
      //                             name: "CREATE ACCOUNT",
      //                             imageLink: 'assets/images/icon_create_account.png',
      //                             onClick: 12,),
      //
      //
      //
      //                         ],
      //                       ),
      //
      //                       Row(
      //                         children: [
      //                           _buildCardItem(
      //                             item_marginLeft: 20,
      //                             item_marginRight: 10,
      //                             name: "FORGET YOUR PASSWORD",
      //                             imageLink: 'assets/images/change_password.png',
      //                             onClick: 13,),
      //
      //
      //                         ],
      //                       )
      //
      //                     }
      //                   ],
      //                 ),
      //               ),
      //             ))
      //           ],
      //         )
      //     )
      // ),
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
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 20),
                    child: InkResponse(
                      onTap: () {
                        if (_drawerKey.currentState!.isDrawerOpen) {
                          profileSectionPageController.isDrawerOpen(false);
                          _drawerKey.currentState!.openEndDrawer();
                          return;
                        } else {
                          _drawerKey.currentState!.openDrawer();
                          profileSectionPageController.isDrawerOpen(true);
                        }
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/app_logo.png",
                    //width: 80,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ],
              )),
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
        decoration: const BoxDecoration(
          color: bottom_bg_color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 00),
          child: Obx(() => Column(
            children: [
              SizedBox(height: 10,),

              if(
              profileSectionPageController.userToken.isNotEmpty &&
                  profileSectionPageController.userToken.value!=null&&
                  profileSectionPageController.userToken.value!="null"
              )...{



                Row(
                  children: [
                    _buildCardItem(
                      item_marginLeft: 20,
                      item_marginRight: 10,
                      name: "MY PROFILE",
                      imageLink: 'assets/images/icon_account.png',
                      onClick: 1,),
                    _buildCardItem(
                      item_marginLeft: 10,
                      item_marginRight: 20,
                      name: "MY QUIZ SCORE",
                      imageLink: 'assets/images/my_quiz_score.png',
                      onClick: 2,),

                  ],
                ),
                Row(
                  children: [
                    _buildCardItem(
                      item_marginLeft: 20,
                      item_marginRight: 10,
                      name: "PAYMENT REQUEST",
                      imageLink: 'assets/images/payment_request.png',
                      onClick: 3,),
                    _buildCardItem(
                      item_marginLeft: 10,
                      item_marginRight: 20,
                      name: "CHANGE PASSWORD",
                      imageLink: 'assets/images/change_password.png',
                      onClick: 4,),





                  ],
                ),
                Row(
                  children: [
                    _buildCardItem(
                      item_marginLeft: 20,
                      item_marginRight: 10,
                      name: "LOGOUT",
                      imageLink: 'assets/images/icon_logout.png',
                      onClick: 5,),



                  ],
                )


              }
              else...{

                Row(
                  children: [
                    _buildCardItem(
                      item_marginLeft: 20,
                      item_marginRight: 10,
                      name: "SIGN IN",
                      imageLink: 'assets/images/icon_log_in_account.png',
                      onClick: 11,),

                    _buildCardItem(
                      item_marginLeft: 10,
                      item_marginRight: 20,
                      name: "CREATE ACCOUNT",
                      imageLink: 'assets/images/icon_create_account.png',
                      onClick: 12,),



                  ],
                ),

                Row(
                  children: [
                    _buildCardItem(
                      item_marginLeft: 20,
                      item_marginRight: 10,
                      name: "FORGET YOUR PASSWORD",
                      imageLink: 'assets/images/change_password.png',
                      onClick: 13,),


                  ],
                )

              }
            ],
          )),
        ));
  }

  Widget _buildCardItem({
    required double item_marginLeft,
    required double item_marginRight,
    required String imageLink,
    required String name,
    required int onClick,
  }) {
    return InkResponse(
      onTap: (){

        if(onClick==1){
        //  _showToast("orders");

          if(profileSectionPageController.userToken.isNotEmpty &&
              profileSectionPageController.userToken.value!=null&&profileSectionPageController.userToken.value!="null"){
           Get.to(MyProfileScreen())?.then((value) => Get.delete<MyProfilePageController>());

          }else{
            showLoginWarning();

          }

          return;
        }
        if(onClick==2){


          if(profileSectionPageController.userToken.isNotEmpty &&
              profileSectionPageController.userToken.value!=null&&profileSectionPageController.userToken.value!="null"){
            Get.to(MyQuizScorePageScreen())?.then((value) => Get.delete<MyQuizScoreController>());
          }else{
            showLoginWarning();

          }



         // _showToast("address");
          return;
        }
        if(onClick==3){

          if(profileSectionPageController.userToken.isNotEmpty &&
              profileSectionPageController.userToken.value!=null&&profileSectionPageController.userToken.value!="null"){
            Get.to(PaymentRequestScreen())?.then((value) => Get.delete<PaymentRequestPageController>());
          }else{
            showLoginWarning();

          }


          return;
        }
        if(onClick==4){
          //wish list
          if(profileSectionPageController.userToken.isNotEmpty &&
              profileSectionPageController.userToken.value!=null&&profileSectionPageController.userToken.value!="null"){
            Get.to(ChangePasswordScreen())?.then((value) => Get.delete<ChangePasswordPageController>());
          }else{
            showLoginWarning();

          }



          return;
        }

        if(onClick==5){

          profileSectionPageController.getUserAccountLogOut(profileSectionPageController.userToken.value);




          return;
        }


        ///before login
        if(onClick==11){

          profileSectionPageController.saveUserInfoRemove(
                userName:"",
                userToken:""
          );
            Get.deleteAll();
            Get.to(LogInScreen());

          return;
        }
        if(onClick==12){

          profileSectionPageController.saveUserInfoRemove(
                userName:"",
                userToken:"");
            Get.deleteAll();
            Get.to(RegistrationScreen());


          return;
        }
        if(onClick==13){

          profileSectionPageController.saveUserInfoRemove(
                userName:"",
                userToken:"");
            Get.deleteAll();
            Get.to(ForgetPasswordScreen());

          return;
        }


      },
      child: Container(
        margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 10,top: 10),
        width: (Get.width/2)-30,
        decoration: BoxDecoration(
          color: profile_item_bg_color ,
          borderRadius: BorderRadius.circular(12),

        ),
        //   height: 150,
        child: Container(
          margin: const EdgeInsets.only(right: 10.0,top: 20,bottom: 20,left: 10),
          // height: double.infinity,
          // width: double.infinity,

          child: Center(
            child: Column(
              children: [


                Align(
                  alignment: Alignment.topCenter,

                  child: Image.asset(
                    imageLink,
                    color: buttonBgColor,
                    width: (Get.width/9),
                    height: (Get.width/9),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor,
                        fontSize: (Get.width/27),
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:2,
                  ),
                ),
                const SizedBox(height: 5,),




              ],
            ),
          ),
        ) ,
      ),

    );
  }





}

