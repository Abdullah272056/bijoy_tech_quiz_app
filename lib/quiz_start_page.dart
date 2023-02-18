
import 'package:bijoy_tech_quiz_app/view/common/toast.dart';
import 'package:bijoy_tech_quiz_app/view/quiz_finished_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../static/Colors.dart';
import 'controller/quiz_start_page_controller.dart';

class QuizStartPageScreen  extends StatelessWidget{

  final quizStartPageScreenController = Get.put(QuizStartPageScreenController());
  var width;
  var height;

  QuizStartPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor:  backGroundColor,
          body: LayoutBuilder(builder: (context,constraints){

           return _buildBodyDesign(context);

          },)
      ),
    );
  }

  Widget _buildBodyDesign(BuildContext context) {
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
                        // Get.to(QuizFinishedPageScreen());
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                  const Text(
                    "Quiz Start",
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
            child: _buildBottomDesign(context),
          ),

        ],
      ),
    );
  }

  Widget _buildBottomDesign(BuildContext context) {
    return Container(
        width: Get.size.width,
        decoration:  const BoxDecoration(
          color: bottom_bg_color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child:Obx(() => Column(
          children: [

            if(quizStartPageScreenController.examAlreadyDone.value=="2")...{
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [

                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: [

                              Padding(padding: EdgeInsets.only(left: 20,top: 20,right: 20),
                                child:  Row(children:  [
                                  Expanded(child:  Obx(() => Text(("Question No: "+
                                      (int.parse(quizStartPageScreenController.currentQuestionNumber.value)+1).toString()+
                                      " of "+
                                      quizStartPageScreenController.totalQuestionNumber.value.toString()
                                  ),
                                      style: TextStyle(
                                          color: buttonBgColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500))),),
                                  Obx(() =>  Text(quizStartPageScreenController.startTxt.value,
                                      style: const TextStyle(
                                          color: buttonBgColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500)),)
                                ],),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                      top: 20,
                                      bottom: 5),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Obx(()=>Text(
                                        "Q: " +quizStartPageScreenController.questionName.value
                                        ,
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.w500))),
                                  )


                              ),

                              Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 15),
                                    color: transparent,
                                    child: Theme(
                                      data: Theme.of(context)
                                          .copyWith(
                                        unselectedWidgetColor:
                                        awsEndColor,
                                      ),
                                      child:  Obx(() => ListView.builder(

                                        itemCount: quizStartPageScreenController.optionList.length,

                                        // physics: NeverScrollableScrollPhysics(),
                                        // shrinkWrap: true,
                                        shrinkWrap: true,
                                        primary: false,
                                        //  physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (
                                            context, index) {
                                          return Obx(() =>  RadioListTile<int>(

                                              value: index,
                                              activeColor: awsEndColor,
                                              title: Text(
                                                quizStartPageScreenController
                                                    .abcdList[index]
                                                    .toString()+'  '+
                                                    // "Abdullah "+index.toString(),
                                                    quizStartPageScreenController.optionList[index]["option"].toString(),
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 16),
                                              ),
                                              groupValue:
                                              quizStartPageScreenController
                                                  .selectedValue
                                                  .value,
                                              onChanged: (value) {


                                                quizStartPageScreenController.selectedAnswer(quizStartPageScreenController.optionList[index]["option"].toString());


                                                quizStartPageScreenController.selectedValueUpdate(index);

                                                quizStartPageScreenController.updateQuestionMcqOptionsId(
                                                    "Abdullah"
                                                  // quizStartPageScreenController
                                                  //     .mcqQuestionDataModel
                                                  //     .
                                                  // value
                                                  //     .data![0]
                                                  //     .questionsOptions[index]
                                                  //     .questionMcqOptionsId
                                                  //     .toString()
                                                );
                                              }));



                                        },
                                      )),


                                    ),
                                  )

                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 20),
                    child: _buildSubmitButton(),
                  ),

                ],
              )),

            }

            else if(quizStartPageScreenController.examAlreadyDone.value=="4")...{
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    "Question Not Found!",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),

                  )


                ],
              )),

            }
            else if(quizStartPageScreenController.examAlreadyDone.value=="1")...{
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    "You have already finished this quiz!",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),

                  )


                ],
              )),

            }
            else...{
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [

                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: [


                              ],
                            ),
                          )
                        ],
                      ),
                    ),


                  ],
                )),

              }




          ],
        )));
  }

  Widget _buildSubmitButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: InkResponse(
        onTap:(){

          if(quizStartPageScreenController.selectedAnswer.value!=""){

            // showToastShort(quizStartPageScreenController.questionId.value);
            // showToastShort(quizStartPageScreenController.currentQuestionNumberForSubmit.value);
            // showToastShort(quizStartPageScreenController.userToken.value);


            quizStartPageScreenController.submitQuizData(
              quizId: quizStartPageScreenController.quizId.value,
                       status: quizStartPageScreenController.quizTypeStatus.value,
                       bookId: quizStartPageScreenController.bookId.value,
                       language: quizStartPageScreenController.language.value,
                       selected_answer: quizStartPageScreenController.selectedAnswer.value,
                       question_id: quizStartPageScreenController.questionId.value,
                  quesNumber: quizStartPageScreenController.currentQuestionNumberForSubmit.value,
                token: quizStartPageScreenController.userToken.value
            );


          }else{

            showToastShort("Please select  Answer!");
          }

          //

        },

        child:Container(
          decoration: BoxDecoration(
              color: buttonBgColor,

              borderRadius: BorderRadius.circular(5.0)
          ),
          height:Get.size.height/16,
          // width: 100,
          alignment: Alignment.center,
          child:  Wrap(
            children:  const [
              Text(
                "Submit",
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


