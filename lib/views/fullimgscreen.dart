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
              width: Get.width / 1.1,
              height: Get.height / 1.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.4),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  homeController.singleUrl.value,
                  fit: BoxFit.fill,
                ),
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
                        height: 30,
                        width: 100,
                        
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                          
                        ),
                        child: Icon(Icons.share),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        await homeController.saveImage();
                        Get.snackbar("Download Successfully.", "",
                            snackPosition: SnackPosition.BOTTOM);

                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.download),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        (homeController.storeUrlList
                            .contains(homeController.singleUrl.value))
                        ? Get.snackbar("Alrady added in favorite", "",
                            snackPosition: SnackPosition.BOTTOM)
                            : ({homeController.storeUrlList.add(homeController.singleUrl.value)},
                        Get.snackbar("Added to Starlist successfully", "",
                            snackPosition: SnackPosition.BOTTOM),);
                      },
                      child: (homeController.storeUrlList
                              .contains(homeController.singleUrl.value))
                          ? Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                              child: const Icon(Icons.favorite, color: Colors.red,),
                            )
                          : Container(
                        height: 30,
                        width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.favorite_border),
                            ),
                    ),
                  ],
                );
              },
              ),
            )
          ],
        ),
      ),
    );
  }
}
