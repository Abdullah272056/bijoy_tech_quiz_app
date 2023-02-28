
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';
import '../../view/common/toast.dart';
import '../api_service/api_service.dart';
import '../view/common/loading_dialog.dart';

class CategoriesListPageController extends GetxController {
  var isDrawerOpen = false.obs;
  var quizCategoriesDataList = [].obs;

  @override
  void onInit() {
    getQuizCategoriesDataList();
    super.onInit();
  }

  void getQuizCategoriesDataList() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          showLoadingDialog("loading...");

          var response = await get(
            Uri.parse('$BASE_URL_API$SUB_URL_API_GET_HOME_CATEGORIES_QUIZ_LIST'),
          );
       //   showToastShort("status = ${response.statusCode}");
          Get.back();

          if (response.statusCode == 200) {

            var dataResponse = jsonDecode(response.body);

            // productDetailsDataList(dataResponse);
            quizCategoriesDataList(dataResponse["data"]);

            //  showToastShort(quizCategoriesDataList.length.toString());

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

}