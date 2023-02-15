import 'package:bijoy_tech_quiz_app/view/payment_request_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../static/Colors.dart';
import '../api_service/api_service.dart';
import '../controller/custom_drawer_controller.dart';
import '../controller/dash_board_page_controller.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import 'auth/change_password_page.dart';
import 'auth/fotget_password_page.dart';
import 'auth/log_in_page.dart';
import 'auth/registration_page.dart';
import 'categories_quiz_details.dart';
import 'home_page/MyQuizScorePage.dart';
import 'home_page/dash_board_page.dart';

class CustomDrawer extends StatelessWidget {
  final customDrawerController = Get.put(CustomDrawerController());

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
                                image:
                                    'https://avatars.githubusercontent.com/u/47354776?v=4',
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
                        const Text(
                          "Abdullah",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "Balance: \$0.00",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
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
                            GetStorage()
                                .read(pref_user_token)
                                .toString()
                                .isNotEmpty) ...{
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

                          ListTile(
                            leading: drawerItemIconDesign(Icons.score),
                            title: drawerItemDesign("My Quiz Scores"),
                            onTap: () {
                              Get.to(MyQuizScorePageScreen());
                            },
                          ),

                          ListTile(
                            leading:
                                drawerItemIconDesign(Icons.wallet_outlined),
                            title: drawerItemDesign("Payment Request"),
                            onTap: () {
                              Get.to(PaymentRequestScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.password),
                            title: drawerItemDesign("Change Password"),
                            onTap: () {
                              Get.to(ChangePasswordScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.logout),
                            title: drawerItemDesign("Log Out"),
                            onTap: () {
                              Navigator.pop(context);

                              removeUserInfo();
                              Get.deleteAll();
                              Get.offAll(LogInScreen());
                            },
                          ),

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
                        } else ...{


                          ListTile(
                            leading:
                            drawerItemIconDesign(Icons.app_registration),
                            title: drawerItemDesign("Create Account"),
                            onTap: () {
                              Navigator.pop(context);
                              Get.to(RegistrationScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.lock_reset_outlined),
                            title: drawerItemDesign("Forget Your Password"),
                            onTap: () {
                              Get.to(ForgetPasswordScreen());
                            },
                          ),

                          ListTile(
                            leading: drawerItemIconDesign(Icons.login),
                            title: drawerItemDesign("Log In"),
                            onTap: () {
                              Navigator.pop(context);

                              removeUserInfo();
                              Get.deleteAll();
                              Get.offAll(LogInScreen());
                            },
                          ),

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
