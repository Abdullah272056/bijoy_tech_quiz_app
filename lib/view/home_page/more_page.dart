import 'package:bijoy_tech_quiz_app/view/payment_request_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/custom_drawer_controller.dart';
import '../../controller/drawer_controller/about_us_controller.dart';
import '../../controller/drawer_controller/contact_us_controller.dart';
import '../../controller/drawer_controller/faq_controller.dart';
import '../../controller/drawer_controller/privacy_policy_controller.dart';
import '../../controller/drawer_controller/terms_of_use_controller.dart';
import '../../controller/more_page_controller.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../auth/change_password_page.dart';
import '../auth/fotget_password_page.dart';
import '../auth/log_in_page.dart';
import '../auth/registration_page.dart';
import '../drawer/about_us.dart';
import '../drawer/contact_us.dart';
import '../drawer/faq.dart';
import '../drawer/privacy_policy.dart';
import '../drawer/terms_of_use.dart';

import '../home_page/MyQuizScorePage.dart';


class MorePage extends StatelessWidget {
  final customDrawerController = Get.put(MorePageController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Expanded(
          child: Container(
              decoration: BoxDecoration(color: bg_top_color),
              // height: MediaQuery.of(context).size.height-kBottomNavigationBarHeight,
              child: Column(
                children: [
                  Container(
                    // height: 150,
                    decoration: const BoxDecoration(color: bg_top_color),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35.0),
                          child: Container(
                              height: 70,
                              width: 70,
                              color: hint_color,
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                placeholder:
                                    'assets/images/profile_image_avater.png',
                                image:BASE_URL_PROFILE_IMAGE+ customDrawerController.imageLink.toString(),
                                    // 'https://avatars.githubusercontent.com/u/47354776?v=4',
                                imageErrorBuilder: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/profile_image_avater.png',
                                  fit: BoxFit.fill,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() =>  Text(
                          customDrawerController.userName.value!=""?customDrawerController.userName.value:"--------",
                          style: const TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),

                        ),),
                        const SizedBox(
                          height: 4,
                        ),

                        Obx(() =>  Text(
                          "Balance: \$"+customDrawerController.amount.value,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),),


                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    color: bottom_bg_color,
                    child: ListView(
                      padding: EdgeInsets.only(top: 10),
                      children: [
                        if (GetStorage().read(pref_user_token) != null &&
                            GetStorage().read(pref_user_token) != "null" &&
                            GetStorage().read(pref_user_token).toString().isNotEmpty) ...{
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.home),
                          //   title: drawerItemDesign("Home"),
                          //   onTap: (){
                          //
                          //     Get.deleteAll();
                          //     Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
                          //
                          //     // Navigator.pop(context);
                          //   },
                          //
                          // ),

                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.person),
                          //   title: drawerItemDesign("My Profile"),
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          // ),

                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.quiz_outlined),
                          //   title: drawerItemDesign("General Quiz"),
                          //   onTap: (){
                          //     Navigator.pop(context);
                          //
                          //   },
                          //
                          // ),
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.quiz_outlined),
                          //   title: drawerItemDesign("Reading Quiz"),
                          //   onTap: (){
                          //     Navigator.pop(context);
                          //   },
                          //
                          // ),
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.quiz_outlined),
                          //   title: drawerItemDesign("Video Quiz"),
                          //   onTap: (){
                          //     Navigator.pop(context);
                          //   },
                          //
                          // ),
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.quiz_outlined),
                          //   title: drawerItemDesign("Spelling Quiz"),
                          //   onTap: (){
                          //     Navigator.pop(context);
                          //   },
                          //
                          // ),

                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.score),
                          //   title: drawerItemDesign("My Quiz Scores"),
                          //   onTap: () {
                          //     Get.to(MyQuizScorePageScreen());
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading:
                          //       drawerItemIconDesign(Icons.wallet_outlined),
                          //   title: drawerItemDesign("Payment Request"),
                          //   onTap: () {
                          //     Get.to(PaymentRequestScreen());
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.password),
                          //   title: drawerItemDesign("Change Password"),
                          //   onTap: () {
                          //     Get.to(ChangePasswordScreen());
                          //   },
                          // ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.list_alt),
                            title: drawerItemDesign("On Going Quizzes"),
                            onTap: () {
                              //  Get.to(ForgetPasswordScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.list_alt),
                            title: drawerItemDesign("Up Coming Quizzes"),
                            onTap: () {
                              //  Get.to(ForgetPasswordScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.info_outline,
                            ),
                            title: drawerItemDesign("About Us"),
                            onTap: (){

                              Get.to(AboutUsPage())?.then((value) => Get.delete<AboutUsController>());
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferRide()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.contact_page,

                            ),
                            title: drawerItemDesign("Contact Us"),
                            onTap: (){

                              Get.to(ContactUsPage())?.then((value) => Get.delete<ContactUsController>());
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.privacy_tip_outlined,

                            ),
                            title: drawerItemDesign("FAQ"),
                            onTap: (){
                              Get.to(FaqPage())?.then((value) => Get.delete<FaqController>());
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferRide()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.privacy_tip_outlined,

                            ),
                            title: drawerItemDesign("Privacy Policy"),
                            onTap: (){
                              Get.to(PrivacyPolicyPage())?.then((value) => Get.delete<PrivacyPolicyController>());
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.privacy_tip_outlined,

                            ),
                            title: drawerItemDesign("TERMS AND CONDITIONS"),
                            onTap: (){
                              Get.to(TermsOfUsePage())?.then((value) => Get.delete<TermsOfUseController>());
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                            },
                          ),

                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.logout),
                          //   title: drawerItemDesign("Log Out"),
                          //   onTap: () {
                          //     customDrawerController.getUserAccountLogOut(GetStorage().read(pref_user_token));
                          //   },
                          // ),

                          //
                          // ExpansionTile(
                          //   leading:Icon(Icons.pages,
                          //     color: sohojatri_color.withOpacity(.6),
                          //     size: 22,
                          //   ) ,
                          //   title: Text("Pages"),
                          //   children: [
                          //
                          //
                          //
                          //     Container(
                          //       margin: EdgeInsets.only(left: 20),
                          //       child: ListTile(
                          //         leading: Icon(Icons.contact_page,
                          //           color: sohojatri_color.withOpacity(.6),
                          //           size: 20,
                          //         ),
                          //         title: Text("Contact Us"),
                          //         onTap: (){
                          //
                          //           // Get.to(ContactUsPage())?.then((value) => Get.delete<ContactUsController>());
                          //           //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                          //         },
                          //       ),
                          //     ),
                          //
                          //
                          //
                          //
                          //
                          //
                          //
                          //   ],
                          //
                          //
                          // ),
                        }
                        else ...{

                          ListTile(
                            leading: drawerItemIconDesign(Icons.list_alt),
                            title: drawerItemDesign("On Going Quizzes"),
                            onTap: () {
                              //  Get.to(ForgetPasswordScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.list_alt),
                            title: drawerItemDesign("Up Coming Quizzes"),
                            onTap: () {
                              //  Get.to(ForgetPasswordScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.info_outline,
                            ),
                            title: drawerItemDesign("About Us"),
                            onTap: (){

                              Get.to(AboutUsPage())?.then((value) => Get.delete<AboutUsController>());
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferRide()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.contact_page,

                            ),
                            title: drawerItemDesign("Contact Us"),
                            onTap: (){

                              Get.to(ContactUsPage())?.then((value) => Get.delete<ContactUsController>());
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.privacy_tip_outlined,

                            ),
                            title: drawerItemDesign("FAQ"),
                            onTap: (){
                              Get.to(FaqPage())?.then((value) => Get.delete<FaqController>());
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferRide()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.privacy_tip_outlined,

                            ),
                            title: drawerItemDesign("Privacy Policy"),
                            onTap: (){
                              Get.to(PrivacyPolicyPage())?.then((value) => Get.delete<PrivacyPolicyController>());
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.privacy_tip_outlined,

                            ),
                            title: drawerItemDesign("Terms And Condition"),
                            onTap: (){
                              Get.to(TermsOfUsePage())?.then((value) => Get.delete<TermsOfUseController>());
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                            },
                          ),













                          // ListTile(
                          //   leading:
                          //   drawerItemIconDesign(Icons.app_registration),
                          //   title: drawerItemDesign("Create Account"),
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //     Get.to(RegistrationScreen());
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.lock_reset_outlined),
                          //   title: drawerItemDesign("Forget Your Password"),
                          //   onTap: () {
                          //     Get.to(ForgetPasswordScreen());
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.login),
                          //   title: drawerItemDesign("Log In"),
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //
                          //     removeUserInfo();
                          //     Get.deleteAll();
                          //     Get.offAll(LogInScreen());
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.info_outline,
                          //   ),
                          //   title: drawerItemDesign("About Us"),
                          //   onTap: (){
                          //
                          //     Get.to(AboutUsPage())?.then((value) => Get.delete<AboutUsController>());
                          //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferRide()));
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.contact_page,
                          //
                          //   ),
                          //   title: drawerItemDesign("Contact Us"),
                          //   onTap: (){
                          //
                          //     Get.to(ContactUsPage())?.then((value) => Get.delete<ContactUsController>());
                          //     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.privacy_tip_outlined,
                          //
                          //   ),
                          //   title: drawerItemDesign("FAQ"),
                          //   onTap: (){
                          //     Get.to(FaqPage())?.then((value) => Get.delete<FaqController>());
                          //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferRide()));
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.privacy_tip_outlined,
                          //
                          //   ),
                          //   title: drawerItemDesign("Privacy Policy"),
                          //   onTap: (){
                          //     Get.to(PrivacyPolicyPage())?.then((value) => Get.delete<PrivacyPolicyController>());
                          //     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                          //   },
                          // ),
                          //
                          // ListTile(
                          //   leading: drawerItemIconDesign(Icons.privacy_tip_outlined,
                          //
                          //   ),
                          //   title: drawerItemDesign("Terms of Use"),
                          //   onTap: (){
                          //     Get.to(TermsOfUsePage())?.then((value) => Get.delete<TermsOfUseController>());
                          //     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveRideScreen()));
                          //   },
                          // ),

                        },
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ))
                ],
              )),
        ),
      ],
    ));
  }

  Widget drawerItemDesign(String itemName) {
    return Text(
      itemName,
      style: TextStyle(color: textColor),
    );
  }

  Widget drawerItemIconDesign(IconData iconData) {
    return Icon(
      iconData,
      color: textColor,
      size: 22,
    );
  }

  void removeUserInfo() async {
    try {
      var storage = GetStorage();
      storage.write(pref_user_name, "");
      storage.write(pref_user_token, "");
    } catch (e) {
      //code
    }
  }


}
