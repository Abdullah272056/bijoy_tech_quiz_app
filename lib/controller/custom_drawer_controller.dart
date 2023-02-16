
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../api_service/api_service.dart';
import '../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../view/common/loading_dialog.dart';
import '../view/common/toast.dart';


class CustomDrawerController extends GetxController {
  var drawerSelectedTab = 1.obs;
  var categoriesList=[].obs;
  var userName="xxxxxx".obs;
  var userToken="".obs;

  var amount="0.00".obs;

  @override
  void onInit() {

    super.onInit();






    loadUserIdFromSharePref();
    // retriveUserInfo();
   // getUserInfoList();
    //getCategories();

  }

  updateUserNameLevelTextColor(int value) {
    drawerSelectedTab(value);
  }

  void getUserInfoList(String token) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showToastShort("call");
          showToastShort( token);


          var response = await get(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_USER_INFO'),
            headers: {
              'Authorization': 'Bearer '+token,
              'Accept': 'application/json',
            },
          );
          showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {
            var dataResponse = jsonDecode(response.body);
            amount(dataResponse["data"]["amount"].toString());
            userName(dataResponse["data"]["user"]["name"]);

          }
          else {
            // Fluttertoast.cancel();
            showToastShort("failed try again!");
          }
        } catch (e) {
          // Fluttertoast.cancel();
        }
      }
      else{
        showToastShort("No Internet Connection!");

      }
    } on SocketException {
      Fluttertoast.cancel();
      // _showToast("No Internet Connection!");
    }
  }



  ///get data from share pref
  void loadUserIdFromSharePref() async {
    try {
      var storage =GetStorage();

       userName(storage.read(pref_user_name));
       userToken(storage.read(pref_user_token));

      getUserInfoList(userToken.value);

   //   _showToast("qwer "+userToken.toString());
    } catch (e) {

    }

  }

  ///get user data from share pref
  void retriveUserInfo() async {
    try {
      var storage =GetStorage();
      // userName(storage.read(pref_user_name).toString());
      // userToken(storage.read(pref_user_token).toString());
     // _showToast("Tokenqw = "+storage.read(pref_user_token).toString());
    }catch(e){

    }

  }


  void getUserAccountLogOut(String token) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //   //_showToast(token);
      //   try {
      //     showLoadingDialog("Processing...");
      //     var response = await post(
      //
      //       Uri.parse('${BASE_URL_API}${SUB_URL_API_LOG_OUT}'),
      //       headers: {
      //         'Authorization': 'Bearer '+token,
      //         'Content-Type': 'application/json',
      //       },
      //     );
      //
      //     Get.back();
      //
      //   //  showToastShort(response.statusCode.toString());
      //     if (response.statusCode == 200) {
      //
      //       saveUserInfoRemove(
      //           userName:"",
      //           userToken:"");
      //       Get.deleteAll();
      //       Get.offAll(LogInScreen());
      //
      //     }
      //     else {
      //       // Fluttertoast.cancel();
      //       //  _showToast("failed try again!");
      //     }
      //   } catch (e) {
      //     // Fluttertoast.cancel();
      //   }
      // }
    } on SocketException {
      Fluttertoast.cancel();
      // _showToast("No Internet Connection!");
    }
  }



  ///user info with share pref
  void saveUserInfoRemove({required String userName,required String userToken,}) async {
    try {
      var storage =GetStorage();
     // storage.write(pref_user_name, userName);
      // storage.write(pref_user_token, userToken);
      // _showToast(userToken.toString());
    } catch (e) {
      //code
    }
  }

}