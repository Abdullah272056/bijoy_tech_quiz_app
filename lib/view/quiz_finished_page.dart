
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../static/Colors.dart';
import '../../controller/categories_wise_quiz_list_page_controller2.dart';
import '../controller/indevidual_quiz_about_page_controller.dart';
import '../controller/pdf_view_page_controller.dart';
import '../controller/quiz_finished_page_controller.dart';
import 'common/toast.dart';
import 'custom_drawer.dart';



class QuizFinishedPageScreen  extends StatelessWidget{

  final quizFinishedPageScreenController = Get.put(QuizFinishedPageScreenController());
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor:  backGroundColor,

          body:

          // Container(
          //
          // ),


          LayoutBuilder(builder: (context,constraints){
           return
           //   SfPdfViewer.network(
           //   'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
           //  // key: _pdfViewerKey,
           // );
             _buildBodyDesign();
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
                        Get.to(QuizFinishedPageScreen());
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                  const Text(
                    "Quiz Finished",
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
        child:Column(
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                const Text(
                  "Congratulation!\nYou have successfully finished Quiz.",
                      textAlign: TextAlign.center,
                  style: TextStyle(
                      color:congratulationTextColor,
                      fontSize:22,
                      fontWeight: FontWeight.w500),

                ),
                SizedBox(height: 15,),
                _buildQuizItemBottomText(name: 'Right Answer:', value: quizFinishedPageScreenController.wrongAnswer.value),
                SizedBox(height: 7,),
                _buildQuizItemBottomText(name: 'Wrong Answer:', value: quizFinishedPageScreenController.rightAnswer.value),
                SizedBox(height: 7,),
                _buildQuizItemBottomText(name: 'Total Mark You Have Got:', value: quizFinishedPageScreenController.totalMarkYouGot.value),

                SizedBox(height: 20,),

                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child: Row(children: const [
                  Expanded(child:Text(
                    'If you get any prize money after finished this particular quiz. We will confirm you. Thanks',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:smallTextColor,
                        fontSize:16,
                        fontWeight: FontWeight.w500),

                  ),)
                ],),
                )

              ],
            )),


          ],
        ));
  }

  Widget _buildHomeCardItem({required double item_marginLeft,required double item_marginRight,
    required String nameText, required String imageLink, }) {
    return InkResponse(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>TeacherProfileViewScreen(teacherId: response["id"].toString() ,)));

      },
      child: Container(
        margin:  EdgeInsets.only(left: item_marginLeft, right: item_marginRight,bottom: 20,top: 10),
        // width: 180,
        decoration: BoxDecoration(
          color:home_item_bg_color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [BoxShadow(

            color:bg_top_color,
            //  blurRadius: 20.0, // soften the shadow
            blurRadius:0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset:
            Offset(
              0.0,
              0.0,
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

                      Row(
                        children: [
                          Expanded(child: _buildQuizItemBottomText(name: 'Language:', value: 'Bangla'),),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildQuizItemBottomText(name: 'Total Question:', value: '5'),)
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(child: _buildQuizItemBottomText(name: 'Every Question Mark:', value: '5'),),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildQuizItemBottomText(name: 'Price Money:', value: '\$10.00'),)
                        ],
                      ),


                      Row(
                        children: [
                          Expanded(child:  _buildQuizItemBottomText(name: 'Price Money Will Get:', value: '2 Top Scorer'),),

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child:  _buildQuizItemBottomText(name: 'Price Money Will Get:', value: '2 Top Scorer'),),

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
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(
          name,
          overflow: TextOverflow.ellipsis,

          style: TextStyle(
              color:smallTextColor,
              fontSize:16,
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
              fontSize: 15,
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


