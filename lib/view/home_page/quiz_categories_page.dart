

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/categories_list_page_controller.dart';
import '../../controller/categories_quiz_details_page_controller.dart';
import '../../controller/quiz_about_more.dart';
import '../../controller/home_controller.dart';
import '../../controller/log_in_page_controller.dart';
import '../common/login_warning.dart';
import 'categories_quiz_details.dart';
import '../common/toast.dart';
import '../drawer/custom_drawer.dart';
import 'categories_wise_quiz_list_page.dart';
import 'quiz_about_more.dart';

class QuizCategoriesScreen  extends StatelessWidget{

  final categoriesListPageController = Get.put(CategoriesListPageController());
  var width;
  var height;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
            return Center(child: SizedBox(
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
            const EdgeInsets.only(left: 10, top: 8, right: 10, bottom: 0),
            child:Column(
              children: [
                Expanded(child: SingleChildScrollView(
                  child: Column(
                    children:  [

                      SizedBox(height: 5,),
                      SizedBox(
                        height: Get.size.height * 0.15,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: (){
                                showToastShort(index.toString());
                              },
                              child: _sliderCardDesign(),
                            ) ;
                          },
                          autoplay: true,
                          pagination: const SwiperPagination(

                              alignment: Alignment.bottomCenter,

                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor: Colors.green)),
                          // control: const SwiperControl(),
                        ),
                      ),
                      SizedBox(height: 5,),

                      Obx(() => GridView.builder(
                          itemCount:categoriesListPageController.quizCategoriesDataList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),

                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:Get.size.width>550? 3:2,
                              crossAxisSpacing:10.0,
                              mainAxisSpacing: 7.0,

                              // mainAxisExtent:Get.size.width>550? 320:250
                              mainAxisExtent:Get.size.width>550? 450:Get.size.height/3.1
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return _buildHomeCardItem(categoriesListPageController.quizCategoriesDataList[index] );
                          }),),
                      SizedBox(height: 15,)

                    ],
                  ),
                )),
              ],
            )

        ));
  }

  Widget _buildHomeCardItem(var response) {
    return InkResponse(
      onTap: (){
       // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child: Container(
        margin:  EdgeInsets.only(left: 0, right: 0,bottom: 00,top: 10),
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
                                height:Get.size.width<550?Get.size.width/3 :Get.size.width/3 ,
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

                                Get.to(() => QuizAboutPageScreen(), arguments: {
                                  "categoriesId": response["id"].toString(),
                                  "categoriesQuizName": response["title"].toString(),
                                  "categoriesImg": BASE_URL_HOME_IMAGE+response["img"].toString(),
                                })?.then((value) => Get.delete<QuizAboutPageController>());

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
                    SizedBox(height: 7,),
                    Padding(padding: EdgeInsets.only(left: 10,right: 10),
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
                    const SizedBox(height: 7,),

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

  Widget _buildGetStartButton( var response)  {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {


          if(categoriesListPageController.userToken.value.isNotEmpty &&
              categoriesListPageController.userToken.value!=null &&
              categoriesListPageController.userToken.value!="null"
          ){
            Get.to(() => CategoriesQuizDetailsPageScreen(), arguments: {
              "categoriesId": response["id"].toString(),
              "categoriesQuizName": response["title"].toString(),
              "categoriesImg": BASE_URL_HOME_IMAGE+response["img"].toString(),
            })?.then((value) => Get.delete<CategoriesQuizDetailsPageController>());

          }else{
            showLoginWarning();
          }


        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(10.0)
          ),
          height:Get.size.height/22,
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

}


