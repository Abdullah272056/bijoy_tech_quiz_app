

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../controller/home_controller.dart';
import '../../controller/log_in_page_controller.dart';
import '../common/toast.dart';
import '../custom_drawer.dart';
import 'categories_wise_quiz_list_page.dart';
import 'general_quiz_details.dart';



class QuizCategoriesScreen  extends StatelessWidget{

  final homeController = Get.put(HomeController());
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
            const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
            child:SingleChildScrollView(
              child: Column(
                children:  [




                  Row(children: [
                    Expanded(child: _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,  nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg')),
                    Expanded(child: _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,   nameText: 'Reading Quiz', imageLink: 'assets/images/reading_quiz.jpg')),
                  ],),

                  Row(children: [
                    Expanded(child: _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,  nameText: 'Video Quiz', imageLink: 'assets/images/video_quiz.png')),
                    Expanded(child: _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,   nameText: 'Spelling Quiz', imageLink: 'assets/images/spelling.png')),
                  ],)

                ],
              ),
            )

        ));
  }


  Widget _sliderCardDesign() {
    // Size size = MediaQuery.of(context).size;
    double sizeHeight = Get.height;
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
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
        borderRadius: BorderRadius.circular(18),
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


  Widget _buildHomeCardItem({required double item_marginLeft,required double item_marginRight, required String nameText, required String imageLink, }) {
    return InkResponse(
      onTap: (){
       // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child: Container(
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

          child: Center(
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

                _buildGetStartButton()


              ],
            ),
          ),
        ) ,
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
  Widget _buildGetStartButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {
          Get.to(CategoriesWiseQuizListPageScreen());
          // Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreen4()));
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

  Widget _buildHomeCardItem1({required double item_marginLeft,required double item_marginRight, required String nameText, required String imageLink, }) {
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

