
import 'package:bijoy_tech_quiz_app/view/auth/registration_page.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../static/Colors.dart';
import '../../controller/general_quiz_details_page_controller.dart';
import '../../controller/log_in_page_controller.dart';
import '../common/toast.dart';





class GeneralQuizDetailsPageScreen  extends StatelessWidget {

  final generalQuizDetailsPageController = Get.put(GeneralQuizDetailsPageController());
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
                    children: const [
                     Expanded(child:  Text(
                       'General Quiz Competition',
                       textAlign: TextAlign.center,
                       overflow: TextOverflow.ellipsis,
                       softWrap: false,
                       maxLines: 2,
                       style: TextStyle(
                           color:forgottenPasswordTextColor,
                           fontSize: 20,
                           decoration: TextDecoration.none,
                           fontWeight: FontWeight.w700),
                     ))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "${generalQuizDetailsPageController.textValue.value}\n\n\n${generalQuizDetailsPageController.textValue.value}\n\n\n${generalQuizDetailsPageController.textValue.value}\n\n\n${generalQuizDetailsPageController.textValue.value}\n\n\n${generalQuizDetailsPageController.textValue.value}\n\n${generalQuizDetailsPageController.textValue.value}",
                    style: TextStyle(
                        color:textColor,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  )



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


  double sizeReturn(int devide){

    return Get.size.height/devide;
  }


}


