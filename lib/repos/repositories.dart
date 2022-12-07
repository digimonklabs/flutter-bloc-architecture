import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../model/news_model.dart';
import '../core/general_path.dart';

class NewsRepositories {
  var endpoint = Uri.parse(GeneralPath.BASE_URI + GeneralPath.API_NEWS);
  List<ArticlesItem> newsModelList = [];

  Future<List<ArticlesItem>> getNews() async {

    debugPrint('endpoint: $endpoint');
    Response response =  await get(endpoint);
    if(response.statusCode == 200){
      Map<String, dynamic> mResponse = jsonDecode(response.body);
      // debugPrint("Response : $mResponse");
      final List result = mResponse['articles'];
      return result.map((e) => ArticlesItem.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}
