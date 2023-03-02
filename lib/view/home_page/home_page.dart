
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/before_join_quiz/general_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/reading_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/spelling_indevidual_quiz_about_page_controller.dart';
import '../../controller/before_join_quiz/video_indevidual_quiz_about_page_controller.dart';
import '../../controller/dash_board_page_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/home_controller1.dart';
import '../../controller/home_controller2.dart';
import '../../controller/log_in_page_controller.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../auth/log_in_page.dart';
import '../auth/registration_page.dart';
import '../before_join_quiz/general_quiz_about_more.dart';
import '../before_join_quiz/reading_indevidual_quiz_about_more.dart';
import '../before_join_quiz/spelling_indevidual_quiz_about_more.dart';
import '../before_join_quiz/video_indevidual_quiz_about_more.dart';
import '../common/login_warning.dart';
import '../common/toast.dart';
import '../drawer/custom_drawer.dart';
import '../before_join_quiz/individual_quiz_about_more.dart';
import 'dash_board_page.dart';

class HomePageScreen  extends StatelessWidget{

  final homeController = Get.put(HomeController());
  var width;
  var height;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {

        Get.deleteAll();
        Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
        return true;

      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor:  backGroundColor,
            key: _drawerKey,
            drawer: CustomDrawer(),
            body: LayoutBuilder(builder: (context,constraints){
              return _buildBodyDesign();
            },)
        ),
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
                    margin: const EdgeInsets.only(left: 25,right: 20),
                    child: InkResponse(
                      onTap: () {

                        if (_drawerKey.currentState!.isDrawerOpen) {
                          homeController.isDrawerOpen(false);
                          _drawerKey.currentState!.openEndDrawer();
                          return;
                        } else
                          _drawerKey.currentState!.openDrawer();
                        homeController.isDrawerOpen(true);
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
        decoration:  const BoxDecoration(
          color: bottom_bg_color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
            padding:
            const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            child:Obx(() => Column(
              children: [

                if(homeController.quizDataList.isNotEmpty)...{
                  Expanded(child:SingleChildScrollView(
                    child: Column(
                      children:  [

                        Obx(() =>  ListView.builder(
                            itemCount:homeController.quizDataList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount:2,
                            //     // crossAxisCount:Get.size.width>550? 2:1,
                            //     crossAxisSpacing: 0.0,
                            //
                            //     mainAxisSpacing: 10.0,
                            //    mainAxisExtent:Get.size.width>550? 350:260
                            // ),
                            itemBuilder: (BuildContext context, int index) {
                              if(homeController.quizDataList[index]["status"].toString()=="1" ||
                                  homeController.quizDataList[index]["status"].toString()=="2"){

                                if(homeController.quizDataList[index]["active_bangla"].toString()=="1" ||
                                    homeController.quizDataList[index]["active_english"].toString()=="1"){
                                  return  _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,
                                      //  nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg',
                                      response: homeController.quizDataList[index]);
                                }
                                else{
                                  return Container();
                                }
                              }
                              else{

                                return  _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,
                                    //   nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg',
                                    response: homeController.quizDataList[index]);

                              }

                            }))

                      ],
                    ),
                  ))
                }
                else...{
                  Expanded(child:  Center(
                    child:Text(
                      "Quiz Not Found!",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16
                      ),
                    ),
                  ))

                }

                // if(
                //     homeController.userToken.value!=""&&
                //     homeController.userToken.value!="null"&&
                //     homeController.userToken.value!=null
                // )...{
                //   if(homeController.quizDataList.isNotEmpty)...{
                //     Expanded(child:  SingleChildScrollView(
                //       child: Column(
                //         children:  [
                //
                //           Obx(() =>  ListView.builder(
                //               itemCount:homeController.quizDataList.length,
                //               shrinkWrap: true,
                //               physics: const NeverScrollableScrollPhysics(),
                //               // gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                //               //     crossAxisCount:2,
                //               //     // crossAxisCount:Get.size.width>550? 2:1,
                //               //     crossAxisSpacing: 0.0,
                //               //
                //               //     mainAxisSpacing: 10.0,
                //               //    mainAxisExtent:Get.size.width>550? 350:260
                //               // ),
                //               itemBuilder: (BuildContext context, int index) {
                //                 if(homeController.quizDataList[index]["status"].toString()=="1" ||
                //                     homeController.quizDataList[index]["status"].toString()=="2"){
                //
                //                   if(homeController.quizDataList[index]["active_bangla"].toString()=="1" ||
                //                       homeController.quizDataList[index]["active_english"].toString()=="1"){
                //
                //                     return  _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,
                //                       //  nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg',
                //                         response: homeController.quizDataList[index]);
                //
                //                   }
                //
                //                   else{
                //                     return Container();
                //                   }
                //                 }
                //                 else{
                //
                //                   return  _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,
                //                    //   nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg',
                //                       response: homeController.quizDataList[index]);
                //
                //                 }
                //
                //               }))
                //
                //         ],
                //       ),
                //     ))
                //   }
                //   else...{
                //     Expanded(child:  Center(
                //       child:Text(
                //         "Quiz Not Found!",
                //         style: TextStyle(
                //           color: textColor,
                //           fontSize: 16
                //         ),
                //       ),
                //     ))
                //
                //   }
                //
                // }
                // else...{
                //
                //   Expanded(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //
                //       children: [
                //
                //         Container(
                //
                //           margin:EdgeInsets.only(right:00.0,top: 0,left: 00,
                //             bottom: 0,
                //           ),
                //           child:Image.asset(
                //             "assets/images/app_logo.png",
                //             // color: sohojatri_color,
                //             // width: 81,
                //             height: 40,
                //             width: 120,
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //         Container(
                //           margin: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                //           child:  Align(
                //             alignment: Alignment.topCenter,
                //             child:   Text(
                //               "This section is Locked",
                //               textAlign: TextAlign.center,
                //
                //               style: TextStyle(
                //                   color: Colors.deepOrangeAccent,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ),
                //         ),
                //
                //         Container(
                //           margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                //           child:  Align(
                //             alignment: Alignment.topCenter,
                //             child: Text(
                //               "Go to login or Sign Up screen \nand try again ",
                //               textAlign: TextAlign.center,
                //
                //               style: TextStyle(
                //                   color: smallTextColor,
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.normal),
                //             ),
                //           ),
                //         ),
                //
                //         Container(
                //           margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 30),
                //           child: ElevatedButton(
                //             onPressed: () {
                //
                //               Get.to(RegistrationScreen());
                //
                //               //  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
                //
                //             },
                //             style: ElevatedButton.styleFrom(
                //                 padding: EdgeInsets.zero,
                //                 shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(7))),
                //             child: Ink(
                //
                //               decoration: BoxDecoration(
                //                   gradient: LinearGradient(colors: [sohojatri_color, sohojatri_color],
                //                     begin: Alignment.centerLeft,
                //                     end: Alignment.centerRight,
                //                   ),
                //                   borderRadius: BorderRadius.circular(7.0)
                //               ),
                //               child: Container(
                //
                //                 height: 40,
                //                 alignment: Alignment.center,
                //                 child:  Text(
                //                   "SIGN UP",
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(
                //                     fontFamily: 'PT-Sans',
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.normal,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //
                //         Container(
                //           margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 0),
                //           child: InkWell(
                //             onTap: (){
                //
                //               Get.to(LogInScreen());
                //               //   Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                //             },
                //             child: Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.transparent,
                //                   borderRadius: BorderRadius.circular(7.0)
                //               ),
                //               height: 40,
                //               alignment: Alignment.center,
                //               child:  Text(
                //                 "LOG IN",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   fontFamily: 'PT-Sans',
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w500,
                //                   color: sohojatri_color,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   )
                // }

              ],
            ))

        ));
  }


  Widget _buildHomeCardItem({required var response,required double item_marginLeft,required double item_marginRight,  }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));
      },
      child: Container(
        margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 10,top: 10),
        // width: 180,
        decoration: BoxDecoration(
          color:home_item_bg_color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(

            color:bg_top_color,
            //  blurRadius: 20.0, // soften the shadow
            blurRadius:0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset:
            Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )],
        ),
        //   height: 150,
        child: Container(
          margin: const EdgeInsets.only(right: 00.0,top: 0,bottom: 0,left: 00),
          // height: double.infinity,
          // width: double.infinity,

          child: Center(
            child: Column(
              children: [

                Stack(children: [
                  Row(
                    children: [
                      Expanded(child:   ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                            height:Get.size.width<550?Get.size.width/3.2 :Get.size.width/3.2 ,
                            color:Colors.white,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/empty.png',
                              image:BASE_URL_HOME_IMAGE+response["home_content"]["img"].toString(),

                              imageErrorBuilder: (context, url, error) =>
                                  Image.asset(
                                    'assets/images/empty.png',
                                    fit: BoxFit.fill,
                                  ),
                            )),

                      )

                      )
                    ],
                  ),

                ]),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    response["title"].toString(),
                    // nameText.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: sizeReturn(40),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),
                ),
                const SizedBox(height: 10,),


                Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Column(
                    children: [



                      _buildQuizItemBottomText(name: 'Quiz Start Time:', value: dateFormat(response["start_date"].toString()),),
                      _buildQuizItemBottomText(name: 'Quiz End Time:', value: dateFormat(response["end_date"].toString())+" "+
                          response["end_time"].toString(),),
                      _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+response["price"].toString()),
                      _buildQuizItemBottomText(name: 'Total Winner:', value: response["person"].toString()),



                      _buildQuizItemBottomText(name: '1st Top Scorer Will Get:',
                          value: response["first_top_money"].toString()!="null"?"\$"+response["first_top_money"].toString():"\$"+"0.00"
                      ),

                      _buildQuizItemBottomText(name: '2nd Top Scorer Will Get:',
                          value: response["second_top_money"].toString()!="null"?"\$"+response["second_top_money"].toString():"\$"+"0.00"
                      ),

                      _buildQuizItemBottomText(name: '3rd Top Scorer Will Get:',
                          value: response["third_top_money"].toString()!="null"?"\$"+response["third_top_money"].toString():"\$"+"0.00"
                      ),

                      _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
                      _buildQuizItemBottomText(name: 'Every Question Mark:', value: response["mark"].toString()),


                      // _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+response["price"].toString()),
                      // _buildQuizItemBottomText(name: 'Price Money Will Get:', value: response["person"].toString()),
                      // // _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$20.00'),
                      // _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+response["each_person_get"].toString()),


                    ],
                  ),
                ),

                _buildJoinQuizButton(response)


              ],
            ),
          ),
        ) ,
      ),

    );
  }


  Widget _buildHomeCardItem1({required var response,required double item_marginLeft,required double item_marginRight, required String nameText, required String imageLink, }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));
      },
      child: Container(
        margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 10,top: 10),
        // width: 180,
        decoration: BoxDecoration(
          color:home_item_bg_color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(

            color:bg_top_color,
            //  blurRadius: 20.0, // soften the shadow
            blurRadius:0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset:
            Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )],
        ),
        //   height: 150,
        child: Container(
          margin: const EdgeInsets.only(right: 00.0,top: 0,bottom: 0,left: 00),
          // height: double.infinity,
          // width: double.infinity,

          child: Center(
            child: Column(
              children: [

                Stack(children: [
                  Row(
                    children: [
                      Expanded(child:   ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                            height:Get.size.width<550?Get.size.width/3.2 :Get.size.width/3.2 ,
                            color:Colors.white,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/empty.png',
                              image:BASE_URL_HOME_IMAGE+response["home_content"]["img"].toString(),

                              imageErrorBuilder: (context, url, error) =>
                                  Image.asset(
                                    'assets/images/empty.png',
                                    fit: BoxFit.fill,
                                  ),
                            )),

                      )

                      )
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(child:Align(alignment: Alignment.topRight,
                  //       child: InkWell(
                  //         onTap: (){
                  //
                  //           showToastShort("more details");
                  //
                  //         },
                  //         child: Container(
                  //
                  //           decoration:  BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                 bottomLeft: Radius.circular(5.0),
                  //               ),
                  //               color: Colors.black.withOpacity(.25)
                  //             //    color: buttonBgColor,
                  //             //    color: buttonBgColor,
                  //           ),
                  //           padding: const EdgeInsets.only(left: 3,right: 3,top: 3,bottom: 3),
                  //           child: Icon(
                  //             Icons.info_outline,
                  //             color: Colors.white,
                  //             size: sizeReturn(40),
                  //           ),
                  //
                  //
                  //         ),
                  //       ),
                  //     )   )
                  //   ],
                  // ),
                ]),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    response["title"].toString(),
                    // nameText.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: sizeReturn(40),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),
                ),
                const SizedBox(height: 15,),


                Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Column(
                    children: [



                      _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
                      _buildQuizItemBottomText(name: 'Every Question Mark:', value: response["mark"].toString()),
                      _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+response["price"].toString()),
                      _buildQuizItemBottomText(name: 'Price Money Will Get:', value: response["person"].toString()),
                      // _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$20.00'),
                      _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+response["each_person_get"].toString()),


                    ],
                  ),
                ),

                _buildJoinQuizButton(response)


              ],
            ),
          ),
        ) ,
      ),

    );
  }


  String dateFormat(String dateString){

    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd-MM-yyyy');
    // var outputFormat = DateFormat('dd-MMM-yyyy');
    // var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }

  Widget _buildQuizItemBottomText({required String name,required String value}) {
    return  Row(
      children:  [
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:smallTextColor,
              fontSize:Get.size.width<320?12: 16,
              fontWeight: FontWeight.w500),
          softWrap: false,
          maxLines:1,
        ),
        SizedBox(width: 5,),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:greenColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          softWrap: false,
          maxLines:1,
        ),
      ],
    );
  }

  Widget _buildJoinQuizButton(var response) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

          //showToastShort(GetStorage().read(pref_user_token));

          if(GetStorage().read(pref_user_token).toString().isNotEmpty &&
              GetStorage().read(pref_user_token)!=null &&
              GetStorage().read(pref_user_token)!="null"
          ){
            if(response["status"].toString()=="1"){
              Get.to(() => GeneralIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": response["status"].toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<GeneralIndividualQuizAboutPagePageController>());
            }
            if(response["status"].toString()=="2"){
              Get.to(() => SpellingIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": response["status"].toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<SpellingIndividualQuizAboutPagePageController>());
            }
            if(response["status"].toString()=="3"){
              Get.to(() => ReadingIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": response["status"].toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<ReadingIndividualQuizAboutPagePageController>());
            }
            if(response["status"].toString()=="4"){
              Get.to(() => VideoIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": response["status"].toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<VideoIndividualQuizAboutPagePageController>());
            }

          }else{
            showLoginWarning();
          }





          // Get.to(IndividualQuizAboutPageScreen());

        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(10.0)
          ),
          height:Get.size.height/18,
          // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children:  [
              Text(
                "Join Quiz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize:16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  double sizeReturn(int divide){
    return Get.size.height/divide;
  }

  Widget _sliderCardDesign() {
    // Size size = MediaQuery.of(context).size;
    double sizeHeight = Get.height;
    return Container(
      margin: EdgeInsets.only(left: 00,right: 00),
      width: double.infinity,
      height: sizeHeight * 0.2,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      //   gradient: const LinearGradient(
      //       colors: [
      //
      //         Color(0xFF7A60A5),
      //         //Color(0xFF82C3DF),
      //         fnf_color,
      //       ],
      //       begin: FractionalOffset(0.0, 0.0),
      //       end: FractionalOffset(1.0, 0.0),
      //       stops: [0.0, 1.0],
      //       tileMode: TileMode.clamp),
      // ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/images/slider_image.jpg"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(child:Container()
          // Image.network(
          //   'https://quiz.bizoytech.com/banner/playquiz.gif',
          //   width: double.infinity,
          //   height: sizeHeight * 0.23,
          //   fit: BoxFit.fill,
          //
          // )
          )
          // Flexible(
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.all(14.0),
          //     child: Container(
          //       height: double.infinity,
          //       // decoration: BoxDecoration(
          //       //   color: const Color(0xFF9689CE),
          //       //   borderRadius: BorderRadius.circular(18),
          //       // ),
          //         decoration: new BoxDecoration(
          //             image: new DecorationImage(
          //               image: new AssetImage("assets/images/slider_image.jpg"),
          //               fit: BoxFit.fill,
          //             ),
          //             borderRadius: BorderRadius.circular(18),
          //         ),
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           // mainAxisSize: MainAxisSize.max,
          //           // mainAxisAlignment: MainAxisAlignment.center,
          //           // crossAxisAlignment: CrossAxisAlignment.center,
          //           children: const [
          //             Text(
          //               "Get the special discount",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //             SizedBox(
          //               height: 18,
          //             ),
          //             Flexible(
          //               child: SizedBox(
          //                 width: double.infinity,
          //                 child: FittedBox(
          //                   fit: BoxFit.contain,
          //                   child: Text(
          //                     "40 %\nOFF",
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       // fontSize: 300,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Flexible(
          //   flex: 3,
          //   child: Padding(
          //     padding: const EdgeInsets.all(14.0),
          //     child: Image.network(
          //       width: double.infinity,
          //       // height: double.infinity,
          //       "https://i.ibb.co/vwB46Yq/shoes.png",
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _sliderCardDesign1() {
    // Size size = MediaQuery.of(context).size;
    double sizeHeight = Get.height;
    return Container(

      width: double.infinity,
      height: sizeHeight * 0.22,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      //   gradient: const LinearGradient(
      //       colors: [
      //
      //         Color(0xFF7A60A5),
      //         //Color(0xFF82C3DF),
      //         fnf_color,
      //       ],
      //       begin: FractionalOffset(0.0, 0.0),
      //       end: FractionalOffset(1.0, 0.0),
      //       stops: [0.0, 1.0],
      //       tileMode: TileMode.clamp),
      // ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/images/slider_image.jpg"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        children: [
          // Flexible(
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.all(14.0),
          //     child: Container(
          //       height: double.infinity,
          //       // decoration: BoxDecoration(
          //       //   color: const Color(0xFF9689CE),
          //       //   borderRadius: BorderRadius.circular(18),
          //       // ),
          //         decoration: new BoxDecoration(
          //             image: new DecorationImage(
          //               image: new AssetImage("assets/images/slider_image.jpg"),
          //               fit: BoxFit.fill,
          //             ),
          //             borderRadius: BorderRadius.circular(18),
          //         ),
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           // mainAxisSize: MainAxisSize.max,
          //           // mainAxisAlignment: MainAxisAlignment.center,
          //           // crossAxisAlignment: CrossAxisAlignment.center,
          //           children: const [
          //             Text(
          //               "Get the special discount",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //             SizedBox(
          //               height: 18,
          //             ),
          //             Flexible(
          //               child: SizedBox(
          //                 width: double.infinity,
          //                 child: FittedBox(
          //                   fit: BoxFit.contain,
          //                   child: Text(
          //                     "40 %\nOFF",
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       // fontSize: 300,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Flexible(
          //   flex: 3,
          //   child: Padding(
          //     padding: const EdgeInsets.all(14.0),
          //     child: Image.network(
          //       width: double.infinity,
          //       // height: double.infinity,
          //       "https://i.ibb.co/vwB46Yq/shoes.png",
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

}


