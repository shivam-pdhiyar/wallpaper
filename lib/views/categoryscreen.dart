import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walmart/controller/categorycontroller.dart';
import 'package:walmart/controller/homecontroller.dart';
import 'package:walmart/views/categoryimg.dart';

class category_Screen extends StatefulWidget {
  const category_Screen({super.key});

  @override
  State<category_Screen> createState() => _category_ScreenState();
}

class _category_ScreenState extends State<category_Screen> {
  final homeController = Get.put(HomeController());
  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(children: [
            Text("Categories", style: TextStyle(fontSize: 20,fontFamily: "Poppins")),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
              child: SizedBox(
                  height: 0.5,
                  child: Container(
                    color: Colors.white,
                  )),
            ),
            Obx(() {
              return GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 70),
                itemCount: categoryController.categoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Obx(
                        () {
                          return InkWell(
                            onTap: () async {
                              homeController.imgList.clear();
                              Get.to(const CategoryImg());
                              categoryController.appbarText.value =
                                  categoryController.categoryList[index]['text'];
                              await homeController.getAllImg(
                                  query: categoryController.categoryList[index]
                                      ['text'],page: 1);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "${categoryController.categoryList[index]['image']}",
                                      ),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: Text(
                                  "${categoryController.categoryList[index]['text']}",
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          ]),
        ),
      ),
    );
  }
}
