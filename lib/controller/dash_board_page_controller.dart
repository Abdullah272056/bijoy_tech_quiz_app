import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../view/home_page/quiz_categories_page.dart';
import '../view/home_page/home_page.dart';

class DashBoardPageController extends GetxController {
  var selectedTabIndex = 0.obs;
  var selectedPageIndex = 1.obs;

  var selectedPage = <Widget>[HomepageScreen()].obs;

  var userName="".obs;
  var userToken="".obs;
  var prefUserType="".obs;

  void ref() {
    onInit();
  }

  @override
  void onInit() {
    log('datasrs: Abdullah');

    loadUserIdFromSharePref();
    super.onInit();


  }


  updateSelectedTabIndex(int index) {
    selectedTabIndex(index);
  }

  updateSelectedPage(List<Widget> page) {
    selectedPage(page);
  }

// Widget
  void onItemTapped(int index) {
    selectedTabIndex(index);
    // _selectedPageIndex = index;
    if (index == 0) {
      // selectedPage(HomePage( ));
      return;
    }

    if (index == 1) {
      //  selectedPage(HomePage( ));
      // selectedPage= ShopPage( );
      return;
    }

    if (index == 2) {
      // selectedPage= AccountPage( );
      return;
    }

    if (index == 3) {
      // selectedPage= CartPage( );
      return;
    }

    if (index == 4) {
      // selectedPage= SearchPage( );
      return;
    }
  }


  ///get data from share pref
  void loadUserIdFromSharePref() async {
    try {
      var storage =GetStorage();
      // userName(storage.read(pref_user_name));
      // userToken(storage.read(pref_user_token));
      // prefUserType(storage.read(pref_user_type));


    } catch (e) {

    }

  }

}
