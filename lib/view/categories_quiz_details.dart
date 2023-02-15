
import 'package:bijoy_tech_quiz_app/view/common/toast.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../controller/before_join_quiz/general_indevidual_quiz_about_page_controller.dart';
import '../controller/before_join_quiz/reading_indevidual_quiz_about_page_controller.dart';
import '../controller/before_join_quiz/spelling_indevidual_quiz_about_page_controller.dart';
import '../controller/before_join_quiz/video_indevidual_quiz_about_page_controller.dart';
import '../controller/categories_quiz_details_page_controller.dart';
import '../controller/indevidual_quiz_about_page_controller.dart';
import 'before_join_quiz/general_quiz_about_more.dart';
import 'before_join_quiz/individual_quiz_about_more.dart';
import 'before_join_quiz/reading_indevidual_quiz_about_more.dart';
import 'before_join_quiz/spelling_indevidual_quiz_about_more.dart';
import 'before_join_quiz/video_indevidual_quiz_about_more.dart';
import 'common/login_warning.dart';

class CategoriesQuizDetailsPageScreen  extends StatelessWidget {

  final categoriesQuizDetailsPageController = Get.put(CategoriesQuizDetailsPageController());
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
     width =MediaQuery.of(context).size.width;
     height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor:  backGroundColor,
        body: LayoutBuilder(builder: (context,constraints){
          return _buildBodyDesign();
        },

        )
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
            margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),

            child: Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(width: 20,),
              InkWell(

                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 27.0,
                ),
                onTap: (){
                  Get.back();
                },
              ),
              SizedBox(width: 20,),
              Expanded(child:Obx(() =>  Text(
                categoriesQuizDetailsPageController.titleName.value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(
                    color:textColor,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),
              )),),

              // InkWell(
              //   onTap: (){},
              //   child:Icon(Icons.info_outline,size: 22,
              //     color: Colors.white,
              //   ) ,
              // ),
              // SizedBox(width:15,),
              // InkResponse(
              //   onTap: () {
              //
              //     // Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreen4()));
              //   },
              //
              //   child:Container(
              //     padding: EdgeInsets.only(left: 7,right: 7,top: 5,bottom: 5),
              //     decoration: BoxDecoration(
              //         color: buttonBgColor,
              //
              //         borderRadius: BorderRadius.circular(4.0)
              //     ),
              //     alignment: Alignment.center,
              //     child:  Wrap(
              //       children:  [
              //         Text(
              //           "Get Start",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             fontFamily: 'PT-Sans',
              //             fontSize:14,
              //             fontWeight: FontWeight.normal,
              //             color: Colors.white,
              //           ),
              //         ),
              //
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(width: 20,),
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
            const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
            child:SingleChildScrollView(
              child: Obx(() => Column(
                children:  [

                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    width: double.infinity,
                    height: Get.size.height * 0.21,

                    decoration:  BoxDecoration(

                      borderRadius: BorderRadius.circular(18),
                    ),
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height:Get.size.width<550?Get.size.width/2.7 :Get.size.width/2.7 ,
                          color:Colors.white,
                          child:  Obx(() => FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/empty.png',
                            image:categoriesQuizDetailsPageController.imageUrl.value,
                            imageErrorBuilder: (context, url, error) =>
                                Image.asset(
                                  "assets/images/empty.png",

                                  fit: BoxFit.fill,
                                ),
                          ))),

                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 10,right: 10),
                  //   width: double.infinity,
                  //   height: Get.size.height * 0.21,
                  //
                  //   decoration:  BoxDecoration(
                  //
                  //     borderRadius: BorderRadius.circular(18),
                  //   ),
                  //   child:  ClipRRect(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     child: Container(
                  //         height:Get.size.width<550?Get.size.width/2.7 :Get.size.width/2.7 ,
                  //         color:Colors.white,
                  //         child:  FadeInImage.assetNetwork(
                  //           fit: BoxFit.cover,
                  //           placeholder: 'assets/images/empty.png',
                  //           image:"https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80",
                  //           imageErrorBuilder: (context, url, error) =>
                  //               Image.asset(
                  //                 "assets/images/empty.png",
                  //
                  //                 fit: BoxFit.fill,
                  //               ),
                  //         )),
                  //
                  //   ),
                  // ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Expanded(child: Obx(()=> Text(
                        categoriesQuizDetailsPageController.quizName.value,
                        // 'General Quiz Competition',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 2,
                        style: TextStyle(
                            color:forgottenPasswordTextColor,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w700),
                      )))
                    ],
                  ),

                  SizedBox(height: 10,),
                  Obx(() => ExpandableText(
                      categoriesQuizDetailsPageController.quizAboutText.value,
                    expandText: '  show more',
                    collapseText: '  show less',
                    maxLines: 7,
                    linkColor: Colors.blue,
                    animation: true,
                    linkStyle : const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                    ),
                    style: const TextStyle(
                        color:textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),


                  //     Text(
                  //   categoriesQuizDetailsPageController.quizAboutText.value,
                  //
                  //   style: TextStyle(
                  //       color:textColor,
                  //       fontSize: 15,
                  //       decoration: TextDecoration.none,
                  //       fontWeight: FontWeight.normal),
                  // ),



                  ),

                  if(categoriesQuizDetailsPageController.onGoingQuizList.length>0)...{
                    Padding(padding: EdgeInsets.only(left: 0,top: 20),
                      child:  Row(
                        children: [
                          Text(
                            'ONGOING QUIZ',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color:recentTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            softWrap: false,
                            maxLines:1,
                          ),
                        ],
                      ),
                    ),

                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        // height:Get.size.width<450?255:260,
                        height:317,

                        // child: _buildRecentlyAddedCourseItem(),
                        child: Obx(() => ListView.builder(
                          padding: EdgeInsets.only(left: 0,top: 0,bottom: 0),
                          scrollDirection: Axis.horizontal,
                          //  shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          // itemCount:homeController.homeDataList[index]["sub_categories"][index1]["products"].isNotEmpty||
                          //     homeController.homeDataList[index]["sub_categories"][index1]["products"].length>0?
                          // homeController.homeDataList[index]["sub_categories"][index1]["products"].length:0,
                          itemCount:categoriesQuizDetailsPageController.onGoingQuizList.length,
                          itemBuilder: (context, index) {
                            if(index!=categoriesQuizDetailsPageController.onGoingQuizList.length-1){
                              return _buildOnGoingQuizItem(response: categoriesQuizDetailsPageController.onGoingQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );

                            }else{
                              return _buildOnGoingQuizItem(response: categoriesQuizDetailsPageController.onGoingQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );
                            }





                          },

                        ))
                    ),

                  },

                  if(categoriesQuizDetailsPageController.recentlyFinishedQuizList.length>0)...{
                    Padding(padding: EdgeInsets.only(left: 0,top: 20),
                      child:  Row(
                        children: [
                          Text(
                            'RECENTLY FINISHED QUIZ',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color:recentTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            softWrap: false,
                            maxLines:1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        // height:Get.size.width<450?255:260,
                        height:285,

                        // child: _buildRecentlyAddedCourseItem(),
                        child: Obx(() => ListView.builder(
                          padding: EdgeInsets.only(left: 0,top: 0,bottom: 0),
                          scrollDirection: Axis.horizontal,
                          //  shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          // itemCount:homeController.homeDataList[index]["sub_categories"][index1]["products"].isNotEmpty||
                          //     homeController.homeDataList[index]["sub_categories"][index1]["products"].length>0?
                          // homeController.homeDataList[index]["sub_categories"][index1]["products"].length:0,
                          itemCount:categoriesQuizDetailsPageController.recentlyFinishedQuizList.length,
                          itemBuilder: (context, index) {
                            if(index!=6){
                              return _buildRecentlyFinishedQuizItem(response: categoriesQuizDetailsPageController.recentlyFinishedQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );

                            }else{
                              return _buildRecentlyFinishedQuizItem(response: categoriesQuizDetailsPageController.recentlyFinishedQuizList[index], height: 00, width: Get.size.width, marginLeft: 0, marginRight: 20, );
                            }





                          },

                        ))
                    ),
                  },

                  SizedBox(height: 30,)
                ],
              )),
            )

        ));
  }

  Widget _buildRecentlyFinishedQuizItem({
    required var response,
    required double height,
    required double width,
    required double marginLeft,
    required double marginRight,
  }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child:

      Container(
        margin:  EdgeInsets.only(left: marginLeft, right: marginRight,bottom: 0,top: 0),
        width: width*.7,
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
          height: double.infinity,
          width: double.infinity,


          child: Center(
            child: Column(
              children: [

                Row(
                  children: [
                    Expanded(child:   ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height:120 ,
                          color:Colors.white,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/empty.png',
                            image:categoriesQuizDetailsPageController.imageUrl.toString(),
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
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child:Text(
                    response["title"].toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:forgottenPasswordTextColor,
                        fontSize: sizeReturn(40),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),),

                const SizedBox(height: 15,),


                Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Column(
                    children: [

                      _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
                      _buildQuizItemBottomText(name: 'Every Question Mark:', value:  response["mark"].toString()),
                      _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+ response["price"].toString()),
                      _buildQuizItemBottomText(name: 'Price Money Will Get:', value:response["person"].toString()+ ' Top Scorer'),
                      _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+response["each_person_get"].toString()),
                      // Obx(() => _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$sdfvgbn'),),








                    ],
                  ),
                )

              ],
            ),
          ),
        ) ,
      ),



    );
  }


  Widget _buildOnGoingQuizItem({
    required var response,
    required double height,
    required double width,
    required double marginLeft,
    required double marginRight,
  }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child:

      Container(
        margin:  EdgeInsets.only(left: marginLeft, right: marginRight,bottom: 0,top: 0),
        width: width*.7,
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
          height: double.infinity,
          width: double.infinity,


          child: Center(
            child: Column(
              children: [

                Row(
                  children: [
                    Expanded(child:   ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height:120 ,
                          color:Colors.white,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/empty.png',
                            image:categoriesQuizDetailsPageController.imageUrl.toString(),
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
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child:Text(
                    response["title"].toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:forgottenPasswordTextColor,
                        fontSize: sizeReturn(40),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),),

               Expanded(child:  Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(padding: EdgeInsets.only(left: 12,right: 12,bottom: 10,top: 10),
                     child: Column(
                       children: [

                         _buildQuizItemBottomText(name: 'Total Question:', value: response["total_quistion"].toString()),
                         _buildQuizItemBottomText(name: 'Every Question Mark:', value:  response["mark"].toString()),
                         _buildQuizItemBottomText(name: 'Price Money:', value: '\$'+ response["price"].toString()),
                         _buildQuizItemBottomText(name: 'Price Money Will Get:', value:response["person"].toString()+ ' Top Scorer'),
                         _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$'+response["each_person_get"].toString()),
                         // Obx(() => _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$sdfvgbn'),),








                       ],
                     ),
                   )
                 ],
               ),),

                _buildContinueButton(response),

              ],
            ),
          ),
        ) ,
      ),



    );
  }


  Widget _buildContinueButton( var response) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

         // showToastShort(categoriesQuizDetailsPageController.userToken.value);


          if(categoriesQuizDetailsPageController.userToken.value.isNotEmpty &&
              categoriesQuizDetailsPageController.userToken.value!=null &&
              categoriesQuizDetailsPageController.userToken.value!="null"
          ){
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="1"){
              Get.to(() => GeneralIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<GeneralIndividualQuizAboutPagePageController>());
            }
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="2"){
              Get.to(() => SpellingIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<SpellingIndividualQuizAboutPagePageController>());
            }
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="3"){
              Get.to(() => ReadingIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<ReadingIndividualQuizAboutPagePageController>());
            }
            if(categoriesQuizDetailsPageController.quizTypeStatus.value=="4"){
              Get.to(() => VideoIndividualQuizAboutPageScreen(), arguments: {

                "quizId": response["id"].toString(),
                "quizStatus": categoriesQuizDetailsPageController.quizTypeStatus.toString(),
                "quizName": response["title"].toString(),

              })?.
              then((value) => Get.delete<VideoIndividualQuizAboutPagePageController>());
            }

          }else{
            showLoginWarning();
          }




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
                "Continue",
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

  Widget _buildQuizItemBottomText({required String name,required String value}) {
    return  Row(
      children:  [
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:smallTextColor,
              fontSize:Get.size.width<320?12: 16,
              fontWeight: FontWeight.w500
          ),
          softWrap: false,
          maxLines:1,
        ),
        SizedBox(width: 5,),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:greenColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          softWrap: false,
          maxLines:1,
        ),
      ],
    );
  }


  double sizeReturn(int devide){

    return Get.size.height/devide;
  }


}


