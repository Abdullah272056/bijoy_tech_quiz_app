import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../static/Colors.dart';
import '../../api_service/api_service.dart';
import '../../controller/my_profile_page_controller.dart';
import '../auth/log_in_page.dart';
import '../auth/registration_page.dart';
import '../custom_drawer.dart';

class MyProfileScreen extends StatelessWidget{
  final myProfilePageController = Get.put(MyProfilePageController());
  var width;
  var height;
  late BuildContext _context;

  // String _particularBirthDate="Enter Birthday";
  // String select_your_country="Enter Birthday";
  late DateTime _myDate;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  MyProfileScreen({super.key});




  @override
  Widget build(BuildContext context) {
    _context = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColor,

          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return _buildBodyDesign();
              } else {
                return Center(
                  child: Container(
                    // height: 100,
                    //  width: 500,
                    child: _buildBodyDesign(),
                    // color: Colors.amber,
                  ),
                );
              }
            },
          )),
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
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 20),
                    child: InkResponse(
                      onTap: () {
                         Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 22.0,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/app_logo.png",
                    //width: 80,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ],
              )),
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
        decoration: const BoxDecoration(
          color: bottom_bg_color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 00),
          child: Obx(() => Column(
                children: [
                  if (myProfilePageController.userToken.value != "" &&
                      myProfilePageController.userToken.value != "null" &&
                      myProfilePageController.userToken.value != null) ...{
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),

                          ClipRRect(
                              borderRadius: BorderRadius.circular(45.0),
                              child: InkWell(
                                onTap: () {
                                  myProfilePageController
                                      .openBottomSheet();
                                },
                                child: Container(
                                    height: 80,
                                    width: 80,
                                    color: hint_color,
                                    child: Obx(() => FadeInImage.assetNetwork(
                                      fit: BoxFit.fill,
                                      placeholder:
                                      'assets/images/profile_image_avater.png',
                                      image:BASE_URL_PROFILE_IMAGE+ myProfilePageController.imageLink.toString(),
                                      // image:'https://avatars.githubusercontent.com/u/47354776?v=4',
                                      imageErrorBuilder:
                                          (context, url, error) => Image.asset(
                                        'assets/images/profile_image_avater.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ))),
                              )),

                          const SizedBox(
                            height: 8,
                          ),

                          Obx(() => Text(
                                myProfilePageController.userName.value,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              )),

                          SizedBox(
                            height: 10,
                          ),

                          //full name

                          levelText("Full Name"),
                          userInputFullName(
                              myProfilePageController.userNameController.value,
                              'Full Name',
                              TextInputType.text),

                          //email
                          levelText("Email"),
                          userInputEmail(
                              myProfilePageController.userEmailController.value,
                              'Email',
                              TextInputType.emailAddress),

                          //phone
                          levelText("Phone Number"),
                          userInputPhoneNumber(
                              myProfilePageController.userPhoneController.value,
                              'Phone Number',
                              TextInputType.emailAddress),

                          //phone
                          levelText("Date of Birth"),
                          userInputBirthDay(),

                          //grade
                          levelText("Grade"),
                          userGradeSelect(),
                          const SizedBox(
                            height: 15,
                          ),

                          //Address
                          levelText("Address"),
                          userInput(
                              myProfilePageController
                                  .userAddressController.value,
                              'Address',
                              TextInputType.text),

                          //city
                          levelText("City"),
                          userInput(
                              myProfilePageController.userCityController.value,
                              'City',
                              TextInputType.text),

                          //city
                          levelText("State"),
                          userInput(
                              myProfilePageController.userStateController.value,
                              'State',
                              TextInputType.text),

                          //city
                          levelText("Zip"),
                          userInput(
                              myProfilePageController.zipCodeController.value,
                              'Zip',
                              TextInputType.text),

                          //Country
                          levelText("Country"),
                          userCountrySelect(),
                          const SizedBox(
                            height: 15,
                          ),

                          //Guardian Name
                          levelText("Guardian Name"),
                          userInput(
                              myProfilePageController
                                  .guardianNameController.value,
                              'Guardian Name',
                              TextInputType.text),

                          //Relation with Guardian
                          levelText("Relation with Guardian"),
                          userInput(
                              myProfilePageController
                                  .relationWithGuardianNameController.value,
                              'Relation with Guardian',
                              TextInputType.text),

                          //Guardian Phone
                          levelText("Guardian Phone"),
                          userInput(
                              myProfilePageController
                                  .guardianPhoneController.value,
                              'Guardian Phone',
                              TextInputType.text),

                          // Guardian Email
                          levelText("Guardian Email"),
                          userInput(
                              myProfilePageController
                                  .guardianEmailController.value,
                              'Guardian Email',
                              TextInputType.text),

                          const SizedBox(
                            height: 10,
                          ),
                          _buildUpdateButton(),

                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ))
                  } else ...{
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: 00.0,
                              top: 0,
                              left: 00,
                              bottom: 0,
                            ),
                            child: Image.asset(
                              "assets/images/app_logo.png",
                              // color: sohojatri_color,
                              // width: 81,
                              height: 40,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 0, top: 20, right: 0, bottom: 0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "This section is Locked",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Go to login or Sign Up screen \nand try again ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: smallTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 30),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(RegistrationScreen());

                                //  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        sohojatri_color,
                                        sohojatri_color
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
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
                            margin: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 0),
                            child: InkWell(
                              onTap: () {
                                Get.to(LogInScreen());
                                //   Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(7.0)),
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
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
                  }
                ],
              )),
        ));
  }

  Widget userInputFullName(TextEditingController userInputController,
      String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInputController,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            suffixIcon: Icon(
              Icons.person,
              color: levelTextColorWhite,
              size: 18,
            ),

            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 16, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputPhoneNumber(TextEditingController userInputController,
      String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInputController,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            suffixIcon: Icon(
              Icons.phone,
              color: levelTextColorWhite,
              size: 18,
            ),

            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 16, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputEmail(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInput,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            suffixIcon: Icon(
              Icons.email_outlined,
              color: levelTextColorWhite,
              size: 20,
            ),

            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInput(TextEditingController userInputController, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: input_box_back_ground_color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInputController,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            // suffixIcon: Icon(Icons.person,
            //   color:  levelTextColorWhite,
            //   size: 18,
            // ),

            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),
            // color: _darkOrLightStatus==1?intello_text_color:intello_bg_color_for_dark,
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 16, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget levelText(
    String levelText,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 0, bottom: 7),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(levelText,
            style: TextStyle(
                color: levelTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  Widget userGradeSelect() {
    return Column(
      children: [
        Container(
            // height: 50,
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20,),
            decoration: BoxDecoration(
                color: input_box_back_ground_color,
                borderRadius: BorderRadius.circular(5)),
            child: Obx(() => DropdownButton2(
                  //  buttonHeight: 40,
                  //   menuMaxHeight:55,
                  itemPadding:
                      EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: bg_top_color,
                  ),
                  iconSize: 30,
                  icon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    ),
                  ),
                  value: myProfilePageController.selectGradeId.value != null &&
                          myProfilePageController.selectGradeId.value.isNotEmpty
                      ? myProfilePageController.selectGradeId.value
                      : null,
                  underline: const SizedBox.shrink(),
                  hint: Row(
                    children: const [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text("Selected State",
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))))
                    ],
                  ),
                  isExpanded: true,

                  /// icon: SizedBox.shrink(),
                  buttonPadding: const EdgeInsets.only(left: 0, right: 0),

                  items: myProfilePageController.ageGradeList.map(
                    (list) {
                      return DropdownMenuItem(
                        alignment: Alignment.centerLeft,

                        // value: list["id"].toString(),
                        value: list.gradeName.toString(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text(list.gradeName,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: textColorWhiteLogin,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    String data =
                        myProfilePageController.selectGradeId(value.toString());
                    //  _showToast("Id ="+checkoutPageController.selectStateId(value.toString()));
                  },
                ))),
      ],
    );
  }

  Widget userCountrySelect() {
    return Column(
      children: [
        Container(
            // height: 50,
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20,),
            decoration: BoxDecoration(
                color: input_box_back_ground_color,
                borderRadius: BorderRadius.circular(5)),
            child: Obx(() => DropdownButton2(
                  //  buttonHeight: 40,
                  //   menuMaxHeight:55,
                  itemPadding:
                      EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: bg_top_color,
                  ),
                  iconSize: 30,
                  icon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: levelTextColor,
                    ),
                  ),
                  value:
                      myProfilePageController.selectCountryId.value != null &&
                              myProfilePageController
                                  .selectCountryId.value.isNotEmpty
                          ? myProfilePageController.selectCountryId.value
                          : null,
                  underline: const SizedBox.shrink(),
                  hint: Row(
                    children: const [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text("Select Country",
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))))
                    ],
                  ),
                  isExpanded: true,

                  /// icon: SizedBox.shrink(),
                  buttonPadding: const EdgeInsets.only(left: 0, right: 0),

                  items: myProfilePageController.countryDataList.map(
                    (list) {
                      return DropdownMenuItem(
                        alignment: Alignment.centerLeft,

                        // value: list["id"].toString(),
                        value: list["name"].toString(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text(list["name"].toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: textColorWhiteLogin,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    String data = myProfilePageController
                        .selectCountryId(value.toString());
                    //  _showToast("Id ="+checkoutPageController.selectStateId(value.toString()));
                  },
                ))),
      ],
    );
  }

  ///user input birth date select box
  Widget userInputBirthDay() {
    return InkResponse(
        onTap: () async {
          _myDate = (await showDatePicker(
            context: _context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          ))!;

          myProfilePageController.particularBirthDate(_myDate.toString());
          // _particularBirthDate = DateFormat('yyyy-MM-dd').format(_myDate);
          myProfilePageController.particularBirthDate(
              (DateFormat('MM/dd/yyyy').format(_myDate)).toString());
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              color: input_box_back_ground_color,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15.0, top: 0, bottom: 0, right: 10),
            child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 0, bottom: 0, right: 10),
                child: Obx(() => Flex(
                      direction: Axis.horizontal,
                      children: [
                        if (myProfilePageController.particularBirthDate ==
                            myProfilePageController.select_your_country) ...{
                          Expanded(
                              child: Obx(() => Text(
                                  myProfilePageController
                                      .particularBirthDate.value,
                                  style: const TextStyle(
                                      color: hint_color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)))),
                        } else ...{
                          Expanded(
                              child: Obx(() => Text(
                                  myProfilePageController
                                      .particularBirthDate.value,
                                  style: const TextStyle(
                                      color: textColorWhiteLogin,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)))),
                        },

                        const Icon(
                          Icons.date_range,
                          size: 22,
                          color: levelTextColor,
                        ),

                        // Image.asset(
                        //   "assets/images/icon_birthday.png",
                        //   width: 18,
                        //   height: 18,
                        //   fit: BoxFit.fill,
                        // ),
                        // Flag.fromCode(FlagsCode.BD, height: 18, width: 22, fit: BoxFit.fill)
                      ],
                    )),
              ),
            ),
          ),
        ));
  }

  Widget _buildUpdateButton() {
    return Container(
      margin: const EdgeInsets.only(left: 00.0, right: 00.0),
      child: ElevatedButton(
        onPressed: () {
          String userNameTxt =
              myProfilePageController.userNameController.value.text;
          String userEmailTxt =
              myProfilePageController.userEmailController.value.text;
          String userPhoneTxt =
              myProfilePageController.userPhoneController.value.text;

          String userAddressTxt =
              myProfilePageController.userAddressController.value.text;
          String userCityTxt =
              myProfilePageController.userCityController.value.text;
          String userStateTxt =
              myProfilePageController.userStateController.value.text;

          String zipCodeTxt =
              myProfilePageController.zipCodeController.value.text;
          String guardianNameTxt =
              myProfilePageController.guardianNameController.value.text;
          String guardianPhoneTxt =
              myProfilePageController.guardianPhoneController.value.text;
          String guardianEmailTxt =
              myProfilePageController.guardianEmailController.value.text;
          String relationWithGuardianTxt = myProfilePageController
              .relationWithGuardianNameController.value.text;

          //   showToastShort(userEmailTxt);

          if (myProfilePageController.inputValid(
                  userNameTxt: userNameTxt,
                  userEmailTxt: userEmailTxt,
                  userPhoneTxt: userPhoneTxt,
                  userDateOfBirthTxt:
                      myProfilePageController.particularBirthDate.value,
                  userAgeGradeTxt: myProfilePageController.selectGradeId.value,
                  addressTxt: userAddressTxt,
                  cityTxt: userCityTxt,
                  stateTxt: userStateTxt,
                  zipCodeTxt: zipCodeTxt,
                  guardianNameTxt: guardianNameTxt,
                  relationWithGuardianTxt: guardianPhoneTxt,
                  guardianPhoneTxt: guardianEmailTxt,
                  guardianEmailTxt: relationWithGuardianTxt,
                  selectedCountryTxt:
                      myProfilePageController.selectCountryId.value) ==
              false) {
            myProfilePageController.updateUserAccountDetails(
              name: userNameTxt,
              grade: myProfilePageController.selectGradeId.value,
              date_of_birth: myProfilePageController.particularBirthDate.value,
              email: userEmailTxt,
              phone: userPhoneTxt,
              address: userAddressTxt,
              city: userCityTxt,
              state: userStateTxt,
              zip: zipCodeTxt,
              country: myProfilePageController.selectCountryId.value,
              guardian: guardianNameTxt,
              relationWithGuardian: relationWithGuardianTxt,
              guardianPhone: guardianPhoneTxt,
              guardianEmail: guardianEmailTxt,
              token: myProfilePageController.userToken.value,
            );
          }
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        child: Ink(
          decoration: BoxDecoration(
              color: forgottenPasswordTextColor,
              borderRadius: BorderRadius.circular(7.0)),
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              "Update",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColorWhiteLogin,
              ),
            ),
          ),
        ),
      ),
    );
  }


}
