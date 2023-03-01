
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:get/get.dart';

import '../../../static/Colors.dart';
import '../../controller/categories_wise_quiz_list_page_controller2.dart';
import '../api_service/api_service.dart';
import '../controller/indevidual_quiz_about_page_controller.dart';
import '../controller/pdf_view_page_controller.dart';
import 'common/toast.dart';
import 'drawer/custom_drawer.dart';



class PdfViewPageScreen  extends StatelessWidget{

  final pdfViewPageScreenController = Get.put(PdfViewPageScreenController());
  var width;
  var height;

  final Completer<PDFViewController> _pdfViewController =
  Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
  StreamController<String>();

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor:  backGroundColor,
          key: _drawerKey,
          drawer: CustomDrawer(),
          body: LayoutBuilder(builder: (context,constraints){
           return _buildBodyDesign();
          },),

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
                  Expanded(child: Obx(() => Text(
                    pdfViewPageScreenController.pdfName.value,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    softWrap: false,
                    maxLines:1,
                  )),),


                  FutureBuilder<PDFViewController>(
                    future: _pdfViewController.future,
                    builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              onTap: () async {
                                final PDFViewController pdfController = snapshot.data!;
                                final int currentPage =
                                (await pdfController.getCurrentPage())! - 1;
                                if (currentPage >= 0) {
                                await pdfController.setPage(currentPage);
                                }
                              },
                              child:  Container(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                                margin: EdgeInsets.only(left: 10,right: 5,top: 0,bottom: 0),
                               // color:Colors.white ,
                                child:Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),

                              ),
                            ),
                          ],
                        );
                      }
                      return Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          InkWell(
                            onTap: () async {

                            },
                            child:  Container(
                              padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                              margin: EdgeInsets.only(left: 10,right: 5,top: 0,bottom: 0),
                              // color:Colors.white ,
                              child:Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: 22,
                              ),

                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    margin: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                    color:Colors.white ,
                    child: Flex(direction: Axis.horizontal,
                      children: [
                        Obx(() => Text(
                          pdfViewPageScreenController.currentPageNumber.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:bottom_bg_color,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          softWrap: false,
                          maxLines:1,
                        )),
                        Text(
                          " - ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:bottom_bg_color,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          softWrap: false,
                          maxLines:1,
                        ),
                        Obx(() => Text(
                          pdfViewPageScreenController.totalPageNumber.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:bottom_bg_color,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          softWrap: false,
                          maxLines:1,
                        )),
                      ],
                    ),

                  ),

                  FutureBuilder<PDFViewController>(
                    future: _pdfViewController.future,
                    builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              onTap: () async {
                                // int pageNumber=pdfViewPageScreenController.currentPageNumber.value+1;
                                // pdfViewPageScreenController.defaultPageNumber(pageNumber);

                                final PDFViewController pdfController = snapshot.data!;
                                final int currentPage =
                                    (await pdfController.getCurrentPage())! + 1;
                                final int numberOfPages = await pdfController.getPageCount() ?? 0;
                                if (numberOfPages > currentPage) {
                                  await pdfController.setPage(currentPage);
                                }

                              },
                              child:  Container(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                                margin: EdgeInsets.only(left: 5,right: 20,top: 0,bottom: 0),
                               // color:Colors.white ,
                                child:Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 22,
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ],
                        );
                      }
                      return  Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          InkWell(
                            onTap: () async {

                            },
                            child:  Container(
                              padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                              margin: EdgeInsets.only(left: 5,right: 20,top: 0,bottom: 0),
                              // color:Colors.white ,
                              child:Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 22,
                                color: Colors.white,
                              ),

                            ),
                          ),
                        ],
                      );
                    },
                  )


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
              Padding(
                  padding:
                  EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  // EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
                  child: Obx(() => PDF(
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onPageChanged: ( int? current, int? total) {
                      pdfViewPageScreenController.currentPageNumber(current);
                      pdfViewPageScreenController.totalPageNumber(total);
                      _pageCountController.add('${current! + 1} - $total');

                    },

                    onViewCreated: (PDFViewController pdfViewController) async {
                      _pdfViewController.complete(pdfViewController);
                      final int currentPage = await pdfViewController.getCurrentPage() ?? 0;
                      final int? pageCount = await pdfViewController.getPageCount();
                      _pageCountController.add('${currentPage + 1} - $pageCount');
                    },
                  ).
                  fromUrl(
                    BASE_URL_PDF_BASE_URL+pdfViewPageScreenController.pdfLink.value,
                    // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                    placeholder: (double progress) => Center(child:
                    Text(
                      '$progress %',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color:recentTextColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      softWrap: false,
                      maxLines:1,
                    ),


                    ),
                    errorWidget: (dynamic error) => Center(child: Text(error.toString())),

                  ))


              )

                // Padding(
                //     padding:
                //     EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
                //     child: Obx(() =>
                //         PDF(
                //           enableSwipe: true,
                //           swipeHorizontal: false,
                //
                //           // autoSpacing: true,
                //           // nightMode: true,
                //           // pageSnap: true,
                //           // pageFling: true,
                //           onError: (error) {
                //             print(error.toString());
                //           },
                //           onPageError: (page, error) {
                //             print('$page: ${error.toString()}');
                //           },
                //
                //
                //           defaultPage: pdfViewPageScreenController.defaultPageNumber.value,
                //           // fitEachPage: true,
                //
                //
                //           onPageChanged: ( page,  total) {
                //             pdfViewPageScreenController.currentPageNumber(page);
                //             pdfViewPageScreenController.totalPageNumber(total);
                //             // showToastShort("current= "+page.toString());
                //             // showToastShort("current= "+total.toString());
                //             // print('page change: $page/$total');
                //           },
                //
                //         ).fromUrl(
                //           'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                //           placeholder: (double progress) => Center(child:
                //           Text(
                //             '$progress %',
                //             overflow: TextOverflow.ellipsis,
                //             style: TextStyle(
                //                 color:recentTextColor,
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.w500),
                //             softWrap: false,
                //             maxLines:1,
                //           ),
                //
                //
                //           ),
                //           errorWidget: (dynamic error) => Center(child: Text(error.toString())),
                //
                //         ))
                //
                //
                // )

              ),


            ],
          ))

    );



  }


  double sizeReturn(int divide){
    return Get.size.height/divide;
  }

}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF From Url'),
      ),
      body:  PDF(
        enableSwipe: true,
        swipeHorizontal: false,
        // autoSpacing: true,
        // nightMode: true,
        pageSnap: true,
        pageFling: true,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },





     defaultPage: 2,

        onPageChanged: ( page,  total) {
          showToastShort("current= "+page.toString());
          showToastShort("current= "+total.toString());
          print('page change: $page/$total');
        },

      ).fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),

      ),
    );
  }
}
