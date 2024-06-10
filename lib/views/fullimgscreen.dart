import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:walmart/controller/homecontroller.dart';

class FullImageScreen extends StatefulWidget {
  const FullImageScreen({super.key});

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Container(
              width: Get.width / 1.4,
              height: Get.height / 1.3,
              color: Colors.red,
              child: Image.network(
                homeController.singleUrl.value,
                fit: BoxFit.fill,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Obx(() {
                return Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        homeController.shareImg();
                      },
                      child: Container(
                        width: 100,
                        color: Colors.grey,
                        child: Icon(Icons.share),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        await homeController.saveImage();
                      },
                      // onTap: () {
                      //   homeController.imgDownloader();
                      // },
                      child: Container(
                        width: 100,
                        color: Colors.grey,
                        child: Icon(Icons.download),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        (homeController.storeUrlList
                            .contains(homeController.singleUrl.value))
                        ? Get.snackbar("Alrady added in favrite", "",
                            snackPosition: SnackPosition.BOTTOM)
                            : ({homeController.storeUrlList.add(homeController.singleUrl.value)},
                        Get.snackbar("Added to Starlist successfully", "",
                            snackPosition: SnackPosition.BOTTOM),);
                      },
                      child: (homeController.storeUrlList
                              .contains(homeController.singleUrl.value))
                          ? Container(
                              width: 100,
                              color: Colors.grey,
                              child: const Icon(Icons.favorite),
                            )
                          : Container(
                              width: 100,
                              color: Colors.grey,
                              child: const Icon(Icons.favorite_border),
                            ),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
