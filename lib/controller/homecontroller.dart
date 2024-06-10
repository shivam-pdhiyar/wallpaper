import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController {
  RxInt currentindexnum = 0.obs;
  RxBool dataloder = false.obs;
  RxBool imgloder = false.obs;
  // RxList nevigationlist = [
  //   const HomeScreen(),
  //   const category_Screen(),
  //   const like_Screen(),
  //   const profile_Screen(),
  // ].obs;
  final searchTEController = TextEditingController();
  RxList imgList = [].obs;
  RxList searchImgList = [].obs;
  RxBool searchCon = false.obs;
  final singleUrl = "".obs;
  final storeUrlList = [].obs;
  RxInt counter = 1.obs;

  getAllImg({query, page}) async {
    try {
      dataloder.value = true;
      var res = await http.get(
          Uri.parse(
              'https://api.pexels.com/v1/search?query=$query&page=$page&per_page=80'),
          headers: {
            'accept': '*/*',
            'Authorization': 'SE3Ue8SgWrIJNpI7u3BiivYK4LCcMfHSdFqG6uuR5PM3ZcFCKIAfr1Kf',
          });
      var data = jsonDecode(res.body);
      imgList.addAll(data["photos"]);
      debugPrint("List length ${imgList.length}");
      debugPrint("statuscode ${res.statusCode}");
    } catch (e) {
      debugPrint("error---->> $e");
    }
  }
  seaechImg({query, page}) async {
    try {
      var res = await http.get(
          Uri.parse(
              'https://api.pexels.com/v1/search?query=$query&page=$page&per_page=80'),
          headers: {
            'accept': '*/*',
            'Authorization': 'SE3Ue8SgWrIJNpI7u3BiivYK4LCcMfHSdFqG6uuR5PM3ZcFCKIAfr1Kf',
          });
      var data = jsonDecode(res.body);
      searchImgList.addAll(data["photos"]);
      debugPrint("List length ${imgList.length}");
      debugPrint("statuscode ${res.statusCode}");
    } catch (e) {
      debugPrint("error---->> $e");
    }
  }

  counterIncreeFun() {
    counter++;
    print(counter.value);
  }
  counterDecreeFun() {
    counter--;
    print(counter.value);
  }

  saveImage() async {
    print("object1");
    var response =
        await Dio().get("$singleUrl", options: Options(responseType: ResponseType.bytes));
    print("object2");
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data),
        quality: 60, name: "");
    print("object3");
    print(result);
  }
  shareImg() async {
    final url = Uri.parse("$singleUrl");
    final res = await http.get(url);
    final bytes = res.bodyBytes;
    final tamp = await getTemporaryDirectory();
    final path = '${tamp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path]);
  }
  final heights = [
    220,
    120,
    180,
    200,
    160,
    140,
  ];

// imgDownloader() async {
//   try {
//     var imageId = await ImageDownloader.downloadImage(
//         "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
//         destination:AndroidDestinationType.directoryDownloads..subDirectory("flutter_img.png"));
//     if (imageId == null) {
//       return;
//     }
//     var fileName = await ImageDownloader.findName(imageId);
//     var path = await ImageDownloader.findPath(imageId);
//     var size = await ImageDownloader.findByteSize(imageId);
//     var mimeType = await ImageDownloader.findMimeType(imageId);
//   } on PlatformException catch (error) {
//     print(error);
//   }
// }

// OntapFun(final index) {
//     currentindexnum.value = index;
//
// }
}
