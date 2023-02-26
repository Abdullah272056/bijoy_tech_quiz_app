import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../controller/drawer_controller/faq_controller.dart';
import '../../controller/drawer_controller/privacy_policy_controller.dart';

import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../../static/Colors.dart';
import '../common/login_warning.dart';



class FaqPage extends StatelessWidget {

  final faqController = Get.put(FaqController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:Container(
          decoration: BoxDecoration(
            color:fnf_title_bar_bg_color,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                // height: 50,
              ),

              Flex(direction: Axis.horizontal,
                children: [
                  SizedBox(width: 5,),
                  IconButton(
                    iconSize: 20,
                    icon:Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    onPressed: () {

                   //   _showToast("back");


                      Get.back();
                    },
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: Text(
                    "Frequent Asked Questions",
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  )),

                  Flex(direction: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0,right: 10),
                        child: InkWell(
                            onTap: (){
                           //   Get.deleteAll();
                           //   Get.offAll(DashBoardPageScreen())?.then((value) => Get.delete<DashBoardPageController>());
                            },
                            child: Icon(
                              Icons.home,
                              size: 25,
                              color: Colors.white,
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                      if(GetStorage().read(pref_user_type).toString()!="vendor")...{
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: InkWell(

                            onTap: () {
                              if (faqController.userToken.isNotEmpty &&
                                  faqController.userToken.value != "null" &&
                                  faqController.userToken.value != null) {
                                // _showToast(homeController.userToken.toString());
                                //  _showToast("add favourite");
                                // Get.off(WishListPage())?.then((value) =>
                                //     Get.delete<WishListPageController>());
                              } else {
                                showLoginWarning();
                              }
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(right: 25),
                          child: InkWell(

                            onTap: () {
                              // Get.off(CartPage())?.then((value) =>
                              //     Get.delete<CartPageController>());
                            },
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 25.0,
                            ),


                          ),
                        ),
                      }
                    ],

                  )
                ],
              ),

              SizedBox(
                height: 7
                // height: 50,
              ),


              Expanded(
                  child:Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Frequent Asked Questions",
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                maxLines: 1,
                                style: TextStyle(
                                    color:fnf_color,
                                    fontSize: 22,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          SizedBox(height: 15,),

                          Obx(() =>  ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: faqController.faqList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                // _showToast(cartPageController.cartList[index].productPhoto.toString());
                                return Obx(() => faqListItem(faqController.faqList[index],faqController.faqListExpandedStatusList[index],index));
                              }))
                          
                        ],
                      ),
                    )



                  )


              )

            ],
          )

      )
    );



  }

  Widget faqListItem(var response,int expandedStatus,int index){
    return  InkWell(
      onTap: (){
        if(expandedStatus==1){
          faqController.faqListExpandedStatusList[index]=0;
        }
        else{
          faqController.faqListExpandedStatusList[index]=1;
        }

      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: hint_color.withOpacity(0.2),)
        ),
        margin:const EdgeInsets.only(left:0, top: 00, right: 0, bottom: 10   ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            Row(
              children: [
                Expanded(child: Container(
                  color: hint_color.withOpacity(0.2),
                  margin:const EdgeInsets.only(left:0, top: 00, right: 0, bottom: 5  ),
                  padding:const EdgeInsets.only(left:0, top: 10, right: 0, bottom: 10  ),
                  // padding:const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 10),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),

                      Expanded(child: Text(
                        response["title"].toString(),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 2,
                        style: TextStyle(
                            color:text_color,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      )),

                      SizedBox(width: 10,),

                      if(expandedStatus==1)...{
                        Icon(
                          Icons.arrow_drop_up,
                          color: Colors.black,
                          size: 29.0,
                        ),
                      }
                      else...{
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.black,
                          size: 29.0,
                        ),

                      },


                      SizedBox(width: 10,)
                    ],
                  ),

                ),),

              ],
            ),

           if(expandedStatus==1)...{

             Align(
               alignment: Alignment.centerLeft,
               child: Container(
                 margin: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 20),
                 //color: Colors.yellow,
                 child: Text(
                   response["description"].toString(),
                   textAlign: TextAlign.left,

                   style: TextStyle(
                       color:hint_color,
                       fontSize: 14,
                       decoration: TextDecoration.none,
                       fontWeight: FontWeight.w500),
                 ),
               ),
             )

           }


          ],
        ),
      ),
    );
  }

}

