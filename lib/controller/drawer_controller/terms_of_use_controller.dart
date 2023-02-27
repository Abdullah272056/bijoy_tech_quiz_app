
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import '../../api_service/api_service.dart';
import '../../data_base/share_pref/sharePreferenceDataSaveName.dart';

import '../../static/Colors.dart';
import '../../view/common/loading_dialog.dart';
import '../../view/common/toast.dart';

class TermsOfUseController extends GetxController {

  var userName="".obs;
  var userToken="".obs;

  // var termsOfUseDataText="Harum in itaque soluta. Cumque quos recusandae qui beatae quis saepe. Ut quasi fugiat voluptatem aut autem facere est. Ut sed natus sit beatae commodi consequuntur est ea. Aut reprehenderit sed minus enim asperiores corrupti ullam hic. Minus laboriosam iste et eveniet aut rerum asperiores. Voluptatibus aliquam aut quasi. Ut vel quibusdam dolorem deleniti. Ratione est minus quibusdam maiores vero. Aut omnis animi est neque tempore. Sit ad porro sint est tempore necessitatibus harum adipisci. Sed natus vel commodi aut modi fugit quis. Et blanditiis dicta voluptatem fugit. Omnis earum earum dolor inventore. Dolorem nulla beatae aut. Rerum architecto quos corrupti mollitia vero enim et. Hic accusamus sit quos eius exercitationem. Est doloremque natus omnis est voluptas est rem. Molestiae sapiente cupiditate suscipit quisquam autem. Ab sint est eum enim. Soluta consectetur culpa ex minima inventore ducimus. Ipsum nesciunt sapiente maiores enim. Ex fuga mollitia beatae suscipit non vitae aliquam tempore. Reiciendis velit unde quis sunt et consequatur omnis. Ut culpa doloribus error fugiat quis et labore qui. Temporibus optio nisi pariatur deserunt enim. Et recusandae voluptatem iure in et. Placeat provident architecto amet adipisci. Nostrum voluptatem ea et. Voluptatem qui atque voluptates aut iste ipsa vitae. Rerum expedita autem et sequi consequatur repudiandae et. Maiores vero ut repudiandae. Voluptates labore molestiae officia nisi. Maiores totam impedit aut odit sequi. Itaque quasi qui non vero praesentium quia. Aut odit eaque molestiae. Deleniti hic facilis rem labore id adipisci nemo. Tempore nulla vitae et cum dolore quis consectetur. Ut qui in provident vel. Alias commodi recusandae quibusdam sit cupiditate adipisci porro. Est non pariatur enim voluptatem dolor vero vel. Accusantium officiis asperiores autem mollitia. Est optio quae corporis corporis rerum est aliquam. Temporibus debitis est velit dolore. Ex unde quasi ullam ea voluptatem voluptas ut. Ut laudantium dicta asperiores eos eos laudantium. Est aperiam placeat sed libero quia qui sunt et. Delectus magnam quo dicta quis quos atque. Sapiente tenetur accusamus aperiam quam. Reprehenderit voluptatem nostrum ex quia sunt. Et maiores praesentium molestiae doloribus vel quia. Odio quasi eveniet in sed aut eos aut distinctio. Et in aut quia. Quaerat in velit sed eos facere. Et tenetur delectus ipsa recusandae quis in. Animi atque est ex qui laboriosam. Quaerat accusamus vero non quidem aliquam vel mollitia. Ut aut est voluptatem temporibus velit animi. Aperiam pariatur mollitia velit eveniet in necessitatibus harum non. Quos doloribus commodi quis minima. Provident ullam quo et voluptatem quos quia nihil. Sit doloribus libero cupiditate. Laborum velit nihil perferendis ea. Vel nam aliquid laboriosam et porro sit perferendis perferendis. Sint temporibus minus odit tempora beatae sequi. Quasi sit saepe iste sed et voluptatum. Libero quia quidem quisquam inventore et. Commodi occaecati perspiciatis debitis ex minima. Eveniet quas minima ex. Minus error eum harum unde commodi. Beatae ex placeat et dicta assumenda ratione. Unde accusantium recusandae est quidem at. Numquam aut recusandae labore non corrupti molestiae. Praesentium debitis doloremque consequuntur quo. Voluptate quasi omnis cum aut. Architecto suscipit atque consectetur vero. Placeat alias eligendi ut voluptatum voluptatem repellat velit quas. Eligendi eveniet ad et dolores. Dolorem praesentium nobis nisi assumenda autem neque ut eligendi. Corrupti aut qui sunt. Voluptatum explicabo mollitia ut a dolor. Laudantium provident iusto rem. Voluptas sit et quis omnis quae placeat. Qui dolorem officia corrupti laborum quae repellendus numquam ut. Sint voluptates assumenda recusandae ut voluptas. Accusamus cumque praesentium amet voluptas rerum saepe. Et dolorem quam tempora esse iure rerum aliquid. Sit aliquid recusandae in sint voluptas enim expedita. Eius incidunt minima illo dolorem. Neque qui error est rerum. Aut commodi perspiciatis perspiciatis aut ab eius provident. Ut ab eaque veniam at quas velit cupiditate. In voluptatibus nihil eum illo omnis culpa ducimus vel. Quibusdam quam quam nesciunt voluptatem. Enim nulla sint vel vero. Quidem soluta cupiditate quo. Qui in a distinctio sunt fugiat quo velit. Fugiat nemo beatae qui eius quisquam aut ducimus. Commodi et totam cum commodi. Quibusdam beatae ut provident cum labore. Quidem placeat distinctio incidunt quae eligendi molestias. Accusamus autem et animi qui. Deleniti laborum illum beatae temporibus aperiam commodi. Rerum adipisci quae amet voluptatibus. Aperiam reprehenderit blanditiis rerum distinctio. Eos sequi itaque minus maiores. Amet excepturi enim quis praesentium error consequatur. Sequi iste aliquid perspiciatis et. Officiis consequatur aperiam voluptas quam et voluptate ratione. Ab ipsum voluptate ut eius voluptas omnis odio aliquam. Iste quisquam et quis. Sapiente quaerat ex quia id sit blanditiis impedit pariatur. Ut dolorem enim ipsa nostrum et in ut. Est magnam beatae iusto provident. Ea aliquid aperiam animi provident recusandae. Doloremque error dolorem deserunt debitis est officiis. Velit magni enim aut voluptas. Nihil aut aspernatur minima magni. Vero eos est non eveniet earum saepe nisi. Culpa in incidunt ad non ut fuga qui. Ut et cum neque voluptatem quis. Perspiciatis omnis et sint quia commodi.".obs;
  var termsOfUseDataText="".obs;
  var termsOfUseDataTitle="".obs;
  @override
  void onInit() {
    super.onInit();
    loadUserIdFromSharePref();
    retriveUserInfo();
    getTermsOfUseData();

  }




  ///get data api call
  void getTermsOfUseData() async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
         // showLoadingDialog("Loading...");
          var response = await get(
            Uri.parse('${BASE_URL_API}${SUB_URL_API_GET_TERMS_OF_USE}'),
          );
        // showToastShort("status = ${response.statusCode}");
          Get.back();
          if (response.statusCode == 200) {
            var responseData = jsonDecode(response.body);
            termsOfUseDataText(responseData["data"]["policy"][0]["terms_and_condition"].toString());
            termsOfUseDataTitle(responseData["data"]["title"]);
            // _showToast(categoriesList.length.toString());
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