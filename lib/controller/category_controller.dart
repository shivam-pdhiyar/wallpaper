import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart'as http;

class CategoryController extends  GetxController{
  RxList categorywallpaper = [].obs;
  RxList categorydata = []. obs;
  
  category() async {
    try {
      var res = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=people&page=2"),
          headers:{ 'Authorization': 'dsMTUKXNfJo6DARQeXBmW8AJgKTz9d3wraLOmuh3OEC2mg3UmDiM2Izw'});
      categorywallpaper.addAll(jsonDecode(res.body)['photos']);

    }catch(e){
      debugPrint("------->$e");
    }
  }
  
}