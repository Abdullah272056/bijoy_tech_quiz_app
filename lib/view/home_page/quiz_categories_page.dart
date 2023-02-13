

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/categories_list_page_controller.dart';
import '../../controller/categories_quiz_details_page_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/log_in_page_controller.dart';
import '../categories_quiz_details.dart';
import '../common/toast.dart';
import '../custom_drawer.dart';
import 'categories_wise_quiz_list_page.dart';
import 'general_quiz_details.dart';



class QuizCategoriesScreen  extends StatelessWidget{

  final categoriesListPageController = Get.put(CategoriesListPageController());
  var width;
  var height;
  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
     width =MediaQuery.of(context).size.width;
     height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor:  backGroundColor,
          key: _drawerKey,
          drawer: CustomDrawer(),
        body: LayoutBuilder(builder: (context,constraints){
          if(constraints.maxWidth<600){
            return _buildBodyDesign();
          }
          else{
            return Center(child:
            Container(
              // height: 100,
            width: Get.size.width,
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
            child: Flex(direction: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25,right: 20),
                  child: InkResponse(
                    onTap: () {

                      if (_drawerKey.currentState!.isDrawerOpen) {
                        categoriesListPageController.isDrawerOpen(false);
                        _drawerKey.currentState!.openEndDrawer();
                        return;
                      } else
                        _drawerKey.currentState!.openDrawer();
                      categoriesListPageController.isDrawerOpen(true);
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
            const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
            child:SingleChildScrollView(
              child: Column(
                children:  [

                  Obx(() => GridView.builder(
                      itemCount:categoriesListPageController.quizCategoriesDataList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:Get.size.width>550? 3:2,
                          crossAxisSpacing:15.0,
                          mainAxisSpacing: 15.0,

                          mainAxisExtent:Get.size.width>550? 320:265
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return _buildHomeCardItem(categoriesListPageController.quizCategoriesDataList[index] );


                      }),),


                  // Row(children: [
                  //   Expanded(child: _buildHomeCardItem1(item_marginLeft: 10, item_marginRight: 10,  nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg')),
                  //   Expanded(child: _buildHomeCardItem1(item_marginLeft: 10, item_marginRight: 10,   nameText: 'Reading Quiz', imageLink: 'assets/images/reading_quiz.jpg')),
                  // ],),
                  //
                  // Row(children: [
                  //   Expanded(child: _buildHomeCardItem1(item_marginLeft: 10, item_marginRight: 10,  nameText: 'Video Quiz', imageLink: 'assets/images/video_quiz.png')),
                  //   Expanded(child: _buildHomeCardItem1(item_marginLeft: 10, item_marginRight: 10,   nameText: 'Spelling Quiz', imageLink: 'assets/images/spelling.png')),
                  // ],)

                ],
              ),
            )

        ));
  }

  Widget _buildHomeCardItem(var response) {
    return InkResponse(
      onTap: (){
       // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child: Container(
        margin:  EdgeInsets.only(left: 0, right: 0,bottom: 10,top: 10),
        child: Wrap(
          children: [
            Container(

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

                child: Column(
                  children: [

                    Stack(children: [
                      Row(
                        children: [
                          Expanded(child:   ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                                height:Get.size.width<550?Get.size.width/2.7 :Get.size.width/2.7 ,
                                color:Colors.white,
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/empty.png',
                                  image:BASE_URL_HOME_IMAGE+response["img"].toString(),
                                  imageErrorBuilder: (context, url, error) =>
                                      Image.asset(
                                        "assets/images/empty.png"
                                        // imageLink.toString(
                                        ,
                                        fit: BoxFit.fill,
                                      ),
                                )),

                          )

                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child:Align(alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: (){
                                showToastShort("more details");

                                Get.to(GeneralQuizDetailsPageScreen());

                              },
                              child: Container(

                                decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5.0),
                                    ),
                                    color: Colors.black.withOpacity(.25)
                                  //    color: buttonBgColor,
                                  //    color: buttonBgColor,
                                ),
                                padding: const EdgeInsets.only(left: 3,right: 3,top: 3,bottom: 3),
                                child: Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: sizeReturn(40),
                                ),


                              ),
                            ),
                          )   )
                        ],
                      ),
                    ],),
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.only(left: 15,right: 15),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          response["title"].toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: sizeReturn(40),
                              fontWeight: FontWeight.w600),
                          softWrap: false,
                          maxLines:2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildGetStartButton(response),
                    )


                  ],
                ),
              ) ,
            )
          ],
        ),
      ),

    );
  }

  Widget _buildHomeCardItem1({required double item_marginLeft,required double item_marginRight, required String nameText, required String imageLink, }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child: Wrap(
        children: [
          Container(
            margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 20,top: 10),
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

              child: Column(
                children: [

                  Stack(children: [
                    Row(
                      children: [
                        Expanded(child:   ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                              height:Get.size.width<550?Get.size.width/2.7 :Get.size.width/2.7 ,
                              color:Colors.white,
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: 'assets/images/general_quiz.jpg',
                                image:"image".toString(),
                                imageErrorBuilder: (context, url, error) =>
                                    Image.asset(
                                      imageLink.toString()
                                      ,
                                      fit: BoxFit.fill,
                                    ),
                              )),

                        )

                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child:Align(alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: (){
                              showToastShort("more details");

                              Get.to(GeneralQuizDetailsPageScreen());

                            },
                            child: Container(

                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5.0),
                                  ),
                                  color: Colors.black.withOpacity(.25)
                                //    color: buttonBgColor,
                                //    color: buttonBgColor,
                              ),
                              padding: const EdgeInsets.only(left: 3,right: 3,top: 3,bottom: 3),
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: sizeReturn(40),
                              ),


                            ),
                          ),
                        )   )
                      ],
                    ),
                  ],),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      nameText.toString(),
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

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container()

                    //_buildGetStartButton(),
                  )


                ],
              ),
            ) ,
          )
        ],
      ),

    );
  }


  Widget _buildReadMoreButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

          // Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreen4()));
        },

        child:Container(
          decoration: BoxDecoration(
            color: buttonBgColor,

              borderRadius: BorderRadius.circular(5.0)
          ),
          height: 35,
         // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children: const [
              Text(
                "Read More",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize: 13,
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
  Widget _buildGetStartButton( var response) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {
          // Get.to(CategoriesQuizDetailsPageScreen());
          Get.to(() => CategoriesQuizDetailsPageScreen(), arguments: {
            "categoriesId": response["id"].toString(),
            "categoriesQuizName": response["title"].toString(),
            "categoriesImg": BASE_URL_HOME_IMAGE+response["img"].toString(),
          })?.then((value) => Get.delete<CategoriesQuizDetailsPageController>());
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
                "Get Start",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize:sizeReturn(48),
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

  double sizeReturn(int devide){

    return Get.size.height/devide;
  }

  Widget _buildHomeCardItem11({required double item_marginLeft,required double item_marginRight, required String nameText, required String imageLink, }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child: Container(
        margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 20,top: 30),
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
          margin: const EdgeInsets.only(right: 00.0,top: 0,bottom: 15,left: 00),
          // height: double.infinity,
          // width: double.infinity,

          child: Center(
            child: Column(
              children: [


                Row(
                  children: [
                    Expanded(child:   ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height: 100,
                          color:Colors.white,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/general_quiz.jpg',
                            image:"image".toString(),
                            imageErrorBuilder: (context, url, error) =>
                                Image.asset(
                                  imageLink.toString()
                                  ,
                                  fit: BoxFit.fill,
                                ),
                          )),

                    )


                    )
                  ],
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    nameText.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),
                ),
                const SizedBox(height: 5,),

                const SizedBox(height: 5,),
                _buildReadMoreButton1(),
                const SizedBox(height: 5,),
                _buildGetStartButton1()


              ],
            ),
          ),
        ) ,
      ),

    );
  }
  Widget _buildReadMoreButton1() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

          // Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreen4()));
        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(5.0)
          ),
          height: 35,
          // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children: const [
              Text(
                "Read More",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize: 13,
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
  Widget _buildGetStartButton1() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

          // Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreen4()));
        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(5.0)
          ),
          height: 35,
          // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children: const [
              Text(
                "Get Start",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize: 13,
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

}


