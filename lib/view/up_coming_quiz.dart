
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/home_controller.dart';
import '../controller/up_coming_quiz_controller.dart';
import 'auth/log_in_page.dart';
import 'auth/registration_page.dart';

class UpComingQuizPageScreen  extends StatelessWidget{

  final homeController = Get.put(UpComingQuizController());
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
          backgroundColor:  backGroundColor,

          body: LayoutBuilder(builder: (context,constraints){
            return _buildBodyDesign();
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

                        Get.back();

                      },
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),

                  const Text(
                    "All Upcoming Quizzes",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:1,
                  ),
                  // Image.asset(
                  //   "assets/images/app_logo.png",
                  //   //width: 80,
                  //   height: 30,
                  //   fit: BoxFit.fill,
                  // ),
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
                  Expanded(child:  SingleChildScrollView(
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
                              return _buildHomeCardItem(
                                  item_marginLeft: 10,item_marginRight: 10,

                                  response: homeController.quizDataList[index]);

                            }))

                      ],
                    ),
                  ))
                }
                else...{
                  const Expanded(child: Center(
                    child:Text(
                      "Quiz is not available at this time!\nThe quiz is coming soon!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16
                      ),
                    ),
                  ))

                }


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

  double sizeReturn(int divide){
    return Get.size.height/divide;
  }

}


