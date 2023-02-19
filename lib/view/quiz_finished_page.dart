
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../static/Colors.dart';
import '../../controller/categories_wise_quiz_list_page_controller2.dart';
import '../controller/dash_board_page_controller.dart';
import '../controller/indevidual_quiz_about_page_controller.dart';
import '../controller/pdf_view_page_controller.dart';
import '../controller/quiz_finished_page_controller.dart';
import 'common/toast.dart';
import 'custom_drawer.dart';
import 'home_page/dash_board_page.dart';



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
                    margin: const EdgeInsets.only(left: 20,right: 20),
                    child: InkResponse(
                      onTap: () {

                        Get.back();

                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                  Expanded(child: Text(
                    "Quiz Finished",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:1,
                  )),
                  Container(
                    margin: const EdgeInsets.only(left: 20,right: 25),
                    child: InkResponse(
                      onTap: () {


                        Get.deleteAll();
                        Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
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
        child:Column(
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                const Text(
                  "Congratulation!\nYou have successfully finished Quiz.",
                      textAlign: TextAlign.center,
                  style: TextStyle(
                      color:recentTextColor,
                      fontSize:22,
                      fontWeight: FontWeight.w500),

                ),
                SizedBox(height: 15,),
                Obx(() => _buildQuizItemBottomText(name: 'Right Answer:', value: quizFinishedPageScreenController.rightAnswer.value),),
                SizedBox(height: 7,),
                Obx(() => _buildQuizItemBottomText(name: 'Wrong Answer:', value: quizFinishedPageScreenController.wrongAnswer.value),),
                SizedBox(height: 7,),
                Obx(() => _buildQuizItemBottomText(name: 'Total Mark You Have Got:', value: quizFinishedPageScreenController.totalMarkYouGot.value),),
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


