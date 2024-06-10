import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walmart/controller/categorycontroller.dart';
import 'package:walmart/controller/homecontroller.dart';
import 'package:walmart/views/fullimgscreen.dart';

class CategoryImg extends StatefulWidget {
  const CategoryImg({super.key});

  @override
  State<CategoryImg> createState() => _CategoryImgState();
}

class _CategoryImgState extends State<CategoryImg> {
  final homeController = Get.put(HomeController());
  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryController.appbarText.value),centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Obx(() {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 250,
              ),
              itemCount: homeController.imgList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    Get.to(const FullImageScreen());
                    homeController.singleUrl.value =
                        "${homeController.imgList[index]['src']['large']}";
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          homeController.imgList[index]["src"]["large"],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FloatingActionButton(
                backgroundColor: Colors.orangeAccent,
                onPressed: () async {
                  homeController.counterDecreeFun();
                  homeController.getAllImg(
                      query: categoryController.appbarText.value,
                      page: homeController.counter.value);
                  homeController.imgList.clear();
                },
                child: Icon(Icons.arrow_left, color: Colors.black, size: 20),
              ),
            ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FloatingActionButton(
                heroTag: 2,
                backgroundColor: Colors.orangeAccent,
                onPressed: () async {
                  homeController.counterIncreeFun();
                  homeController.getAllImg(
                      query: categoryController.appbarText.value,
                      page: homeController.counter.value);
                  homeController.imgList.clear();
                },
                child: Icon(Icons.arrow_right, color: Colors.black, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
