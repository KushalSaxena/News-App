import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

import '../models/slider_model.dart';

class Sliders{
  List<sliderModel> sliders = [];

  Future<void> getSlider() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3685322bd71b4dd2b1e2328e529a03dc";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          sliderModel slidermodel = sliderModel(
            title: element['title'],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],);
          sliders.add(slidermodel);
        }
      });
    }
  }

}