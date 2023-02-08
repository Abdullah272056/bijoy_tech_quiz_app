

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../controller/home_controller.dart';
import '../../controller/home_controller1.dart';
import '../../controller/log_in_page_controller.dart';
import '../common/toast.dart';
import '../custom_drawer.dart';



class Homepage1Screen  extends StatelessWidget{

  final homeController = Get.put(HomeController1());
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
                  const SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.only(left: 10),
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
                  const SizedBox(height: 10,),
                  ListView.builder(
                      itemCount:4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      // gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount:Get.size.width>550? 2:1,
                      //     crossAxisSpacing: 0.0,
                      //
                      //     mainAxisSpacing: 10.0,
                      // //    mainAxisExtent:Get.size.width>550? 350:260
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

  double sizeReturn(int divide){
    return Get.size.height/divide;
  }


}


