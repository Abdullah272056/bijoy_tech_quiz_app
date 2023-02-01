import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../static/Colors.dart';


void showLoginWarning( ) {

  Get.defaultDialog(
      contentPadding: EdgeInsets.zero,
      //  title: '',
      titleStyle: TextStyle(fontSize: 0),
      // backgroundColor: Colors.white.withOpacity(.8),
      content: Wrap(
        children: [

          Stack(
            children: [
              Container(

                  child:   Center(
                    child: Column(
                      children: [

                        Container(

                          margin:EdgeInsets.only(right:00.0,top: 0,left: 00,
                            bottom: 0,
                          ),
                          child:Image.asset(
                            "assets/images/fnf_logo.png",
                            // color: sohojatri_color,
                            // width: 81,
                            height: 40,
                            width: 90,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                          child:  Align(
                            alignment: Alignment.topCenter,
                            child:   Text(
                              "This section is Locked",
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                  color: text_color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                          child:  Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Go to login or Sign Up screen \nand try again ",
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                  color: text_color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                          //    Get.to(SignUpScreen());

                              //  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));

                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7))),
                            child: Ink(

                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [sohojatri_color, sohojatri_color],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0)
                              ),
                              child: Container(

                                height: 40,
                                alignment: Alignment.center,
                                child:  Text(
                                  "SIGN UP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'PT-Sans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 0),
                          child: InkWell(
                            onTap: (){
                              Get.back();
                             // Get.to(LogInScreen());
                              //   Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7.0)
                              ),
                              height: 40,
                              alignment: Alignment.center,
                              child:  Text(
                                "LOG IN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'PT-Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: sohojatri_color,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )

              ),
              Align(alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(right: 10),



                  child: InkWell(
                    onTap: (){
                      Get.back();


                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.deepOrangeAccent,
                      size: 22.0,
                    ),
                  ),
                ),

              ),
            ],
          )

        ],
        // child: VerificationScreen(),
      ),
      barrierDismissible: false,
      radius: 10.0);
}