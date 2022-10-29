
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class providerscreen extends ChangeNotifier {
List data=[];
bool loading=true;
getDataFromApi({required String categoryname}) async {
  loading=true;
 http.Response response = await http.get(

     Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$categoryname&apiKey=bcab4ccbe2314cb48eef06d945ee8a31'));
if(response.statusCode==200){
   data= json.decode( response.body)['articles'];}
loading=false;
   notifyListeners();
}

}
