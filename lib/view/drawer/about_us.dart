import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/dash_board_page_controller.dart';
import '../../controller/drawer_controller/about_us_controller.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../../static/Colors.dart';

import '../common/login_warning.dart';
import '../home_page/dash_board_page.dart';


class AboutUsPage extends StatelessWidget {

final aboutUsController = Get.put(AboutUsController());

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
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
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                ),
                Expanded(child:Text(
                  "ABOUT US",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  softWrap: false,
                  maxLines:1,
                ),),

                Container(
                  margin: EdgeInsets.only(top: 0,right: 20),
                  child: InkWell(
                      onTap: (){
                        Get.deleteAll();
                        Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
                      },
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: Colors.white,
                      )
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
  return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
          width: Get.size.width,
          padding: EdgeInsets.only(
              left: 14,right: 15,
              top: 20
          ),
          decoration:  const BoxDecoration(
            color: bottom_bg_color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child:Column(
            children: [
              Expanded(child:
              SingleChildScrollView(
                  child:Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ABOUT US",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                            style: TextStyle(
                                color:recentTextColor,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Obx(() =>   Text(
                        aboutUsController.aboutUsDataText.value,
                        style: TextStyle(
                            color:textColor,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal),
                      ))
                    ],
                  )
              )



              ),


            ],
          ))

  );



}




}

