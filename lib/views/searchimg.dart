import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walmart/controller/homecontroller.dart';
import 'package:walmart/views/fullimgscreen.dart';

class SearchImg extends StatefulWidget {
  const SearchImg({super.key});

  @override
  State<SearchImg> createState() => _SearchImgState();
}

class _SearchImgState extends State<SearchImg> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: homeController.searchTEController,
                decoration: InputDecoration(
                  hintText: "Enter category",
                  suffixIcon: InkWell(
                    onTap: () {
                      debugPrint(homeController.searchTEController.text);
                      homeController.seaechImg(
                          page: homeController.counter,
                          query: homeController.searchTEController.text);
                    },
                    child: Icon(CupertinoIcons.search_circle),
                  ),
                ),
              ),
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Obx(() {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10),

                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController.searchImgList.length,
                    itemBuilder: (ctx, index) {
                      homeController.heights.shuffle();
                      return InkWell(
                        onTap: () async {
                          print('${homeController.heights.indexed}');
                          Get.to(FullImageScreen());
                          homeController.singleUrl.value =
                              "${homeController.searchImgList[index]['src']['large']}";
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Obx(() {
                            homeController.heights.shuffle();
                            return Image.network(
                                height: homeController.heights.first.toDouble(),
                                "${homeController.searchImgList[index]['src']['large']}",
                                fit: BoxFit.cover);
                          }),
                        ),
                      );

                    },
                  );

                }),
              ),
            ]),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Row(
          children: [
            homeController.counter < 1
                ? Obx(() {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FloatingActionButton(
                        backgroundColor: Colors.orangeAccent,
                        onPressed: () async {
                          homeController.counterDecreeFun();
                          homeController.seaechImg(
                              query: homeController.searchTEController.text,
                              page: homeController.counter.value);
                          homeController.imgList.clear();
                        },
                        child: Icon(Icons.arrow_left, color: Colors.black, size: 20),
                      ),
                    );
                  })
                : SizedBox(),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FloatingActionButton(
                heroTag: 2,
                backgroundColor: Colors.orangeAccent,
                onPressed: () async {
                  homeController.counterIncreeFun();
                  homeController.seaechImg(
                      query: homeController.searchTEController.text,
                      page: homeController.counter.value);
                  homeController.searchImgList.clear();
                },
                child: const Icon(Icons.arrow_right, color: Colors.black, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
