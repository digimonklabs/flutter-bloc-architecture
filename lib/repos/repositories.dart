import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../core/app_constants.dart';
import '../model/news_model.dart';
import '../core/general_path.dart';

class NewsRepositories {
  String? isoCountryCode = "";

  getCountry() async{
    Response response =  await get(Uri.parse("http://ip-api.com/json"),);
    if(response.statusCode == 200){
      Map<String, dynamic> mResponse = jsonDecode(response.body);
      isoCountryCode = mResponse['countryCode'];
      debugPrint('countrycode: ${isoCountryCode}');
    }
  }

  List<ArticlesItem> newsModelList = [];

  Future<List<ArticlesItem>> getNews() async {

   await getCountry();

    String endpoint = "${GeneralPath.API_NEWS}$isoCountryCode&category=business&apiKey=$API_KEY";

    var finalEndpoint = Uri.parse(GeneralPath.BASE_URI + endpoint);
    debugPrint('endpoint: $endpoint');

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
    };

    Response response =  await get(finalEndpoint, headers: headers);
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
