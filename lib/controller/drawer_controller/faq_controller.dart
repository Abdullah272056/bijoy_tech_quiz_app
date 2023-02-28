
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import '../../api_service/api_service.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';
import '../../view/common/loading_dialog.dart';
import '../../view/common/toast.dart';

class FaqController extends GetxController {

  var userName="".obs;
  var userToken="".obs;

  var faqText="".obs;
  var faqTextTitle="".obs;


  var faqList=[].obs;
  var faqListExpandedStatusList=[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUserIdFromSharePref();
    retriveUserInfo();
    getPrivacyPolicyData();
  }
  ///get data api call
  void getPrivacyPolicyData() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("Loading...");
          var response = await get(
            Uri.parse('${BASE_URL_API}${SUB_URL_API_GET_FAQ}'),
          );
         //  showToastShort("status = ${response.statusCode}");
          Get.back();
          if (response.statusCode == 200) {
            var responseData = jsonDecode(response.body);


            faqText(responseData["data"]["faq"][0]["desc"]);
            faqTextTitle(responseData["data"]["faq"][0]["title"]);


            faqList(responseData["data"]["qnas"]);

           // showToastShort(faqList.length.toString());
            var n = List.generate(faqList.length+1, (index) => 0);
            faqListExpandedStatusList(n);


           // privacyDataTitle(responseData["data"]["title"]);
           // _showToast("len= "+faqListExpandedStatusList.length.toString());
          }
          else {
            // Fluttertoast.cancel();

            showToastShort("failed try again!");
          }
        } catch (e) {
          // Fluttertoast.cancel();
        }
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
     // _showToast("qwer "+userToken.toString());
    } catch (e) {

    }

  }

  ///get user data from share pref
  void retriveUserInfo() async {
    try {
      var storage =GetStorage();
      userName(storage.read(pref_user_name).toString());
      userToken(storage.read(pref_user_token).toString());
    //  _showToast("Tokenqw = "+storage.read(pref_user_token).toString());
    }catch(e){

    }

  }

}