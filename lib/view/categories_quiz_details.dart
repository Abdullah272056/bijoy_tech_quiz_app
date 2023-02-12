
import 'package:bijoy_tech_quiz_app/view/auth/registration_page.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../controller/general_quiz_details_page_controller.dart';
import '../../controller/log_in_page_controller.dart';
import '../controller/categories_quiz_details_page_controller.dart';
import 'common/toast.dart';






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
              Expanded(child: Text(
                'General Quiz ',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(
                    color:textColor,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),
              ),),

              InkWell(
                onTap: (){},
                child:Icon(Icons.info_outline,size: 22,
                  color: Colors.white,
                ) ,
              ),
              SizedBox(width:15,),
              InkResponse(
                onTap: () {

                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreen4()));
                },

                child:Container(
                  padding: EdgeInsets.only(left: 7,right: 7,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                      color: buttonBgColor,

                      borderRadius: BorderRadius.circular(4.0)
                  ),
                  alignment: Alignment.center,
                  child:  Wrap(
                    children:  [
                      Text(
                        "Get Start",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PT-Sans',
                          fontSize:14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
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
              child: Column(
                children:  [

                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    width: double.infinity,
                    height: Get.size.height * 0.21,

                    decoration: new BoxDecoration(

                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(child:

                    ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
              child: Container(
                  height:Get.size.width<550?Get.size.width/2.7 :Get.size.width/2.7 ,
                  color:Colors.white,
                  child:  FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/general_quiz.jpg',
                    image:"image".toString(),
                    imageErrorBuilder: (context, url, error) =>
                        Image.asset(
                          "assets/images/general_quiz.jpg".toString()
                          ,

                          fit: BoxFit.fill,
                        ),
                  )),

            )

                       )

                      ],
                    ),
                  ),
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
                  Obx(() => Text(
                    categoriesQuizDetailsPageController.quizAboutText.value,

                    style: TextStyle(
                        color:textColor,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),),



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

                  SizedBox(height: 30,)
                ],
              ),
            )

        ));
  }

  Widget _buildRecentlyFinishedQuizItem2({
    required String imageLink,
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
                    "nameText".toString(),
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


                      _buildQuizItemBottomText(name: 'Total Question:', value: '10'),
                      _buildQuizItemBottomText(name: 'Every Question Mark:', value: '1'),
                      _buildQuizItemBottomText(name: 'Price Money:', value: '\$20.00'),
                      _buildQuizItemBottomText(name: 'Price Money Will Get:', value: '1 Top Scorer'),
                      _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$20.00'),


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
                            placeholder: 'assets/images/general_quiz.jpg',
                            image:"image".toString(),
                            imageErrorBuilder: (context, url, error) =>
                                Image.network(
                                  "imageLink".toString()
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
                      _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$sdfvgbn'),
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
                            placeholder: 'assets/images/general_quiz.jpg',
                            image:"image".toString(),
                            imageErrorBuilder: (context, url, error) =>
                                Image.network(
                                  "imageLink".toString()
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
                      _buildQuizItemBottomText(name: 'Top Each Person Will Get:', value: '\$sdfvgbn'),
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


  double sizeReturn(int devide){

    return Get.size.height/devide;
  }


}

