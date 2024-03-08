import 'dart:convert';

import 'package:news_api_app/models/show_category.dart';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

import '../models/slider_model.dart';

class ShowCategoryNews{
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=3685322bd71b4dd2b1e2328e529a03dc";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          ShowCategoryModel showCategoryModel= ShowCategoryModel(
            title: element['title'],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],);
          categories.add(showCategoryModel);
        }
      });
    }
  }

}