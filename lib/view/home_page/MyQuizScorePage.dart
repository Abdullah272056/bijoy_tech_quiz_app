

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../controller/home_controller.dart';
import '../../controller/home_controller1.dart';
import '../../controller/home_controller2.dart';
import '../../controller/log_in_page_controller.dart';
import '../../controller/my_quiz_score_controller.dart';
import '../common/toast.dart';
import '../custom_drawer.dart';

class MyQuizScorePageScreen  extends StatelessWidget{

  final homeController = Get.put(MyQuizScoreController());
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
                  Text(
                    "My Quiz Scores",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:1,
                  )
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


                  ListView.builder(
                      itemCount:4,
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
                        return  _buildHomeCardItem(item_marginLeft: 10, item_marginRight: 10,  nameText: 'General Quiz', imageLink: 'assets/images/general_quiz.jpg');
                      })

                ],
              ),
            )

        ));
  }

  Widget _buildHomeCardItem({required double item_marginLeft,required double item_marginRight, required String nameText, required String imageLink, }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child: Container(
        margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom:8,top: 8),
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


                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Upcoming General Quiz 1".toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: sizeReturn(44),
                        fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines:1,
                  ),
                ),
                const SizedBox(height: 15,),


                Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildQuizItemBottomText(name: 'Date:', value: '02/08/2023'),),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildQuizItemBottomText(name: 'Book/Video:', value: ''),),
                          SizedBox(width: 10,),
                          Expanded(child: _buildQuizItemBottomText(name: 'Language:', value: ''),)

                          

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildQuizItemBottomText(name: 'Right:', value: '03'),),
                          SizedBox(width: 10,),
                          Expanded(child: _buildQuizItemBottomText(name: 'Wrong:', value: '10'),)

                        ],
                      ),
                      Row(
                        children: [
                         Expanded(child:  _buildQuizItemBottomText(name: 'Score Got:', value: '09'),),
                          SizedBox(width: 10,),
                         Expanded(child:  _buildQuizItemBottomText(name: 'Total Mark:', value: '10.00'),)
                        ],
                      ),
                      Row(
                        children: [
                         Expanded(child:  _buildQuizItemBottomText(name: 'Position:', value: '09'),),
                         SizedBox(width: 10,),
                         Expanded(child:  _buildQuizItemBottomText(name: 'Prize Money:', value: '\$0.00'),)
                        ],
                      ),






                    ],
                  ),
                ),




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

  Widget _buildJoinQuizButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap: () {

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


}


