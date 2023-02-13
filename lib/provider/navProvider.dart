
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class providerscreen extends ChangeNotifier {
List data=[];
bool loading=false;
List searchData=[];
bool loadingSearch=false;
getDataFromApi({required String categoryname}) async {
  loading=true;
  data=[];
 http.Response response = await http.get(

     Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$categoryname&apiKey=bcab4ccbe2314cb48eef06d945ee8a31'));
if(response.statusCode==200){
   data= json.decode( response.body)['articles'];}
loading=false;
   notifyListeners();
}
search({required String keyword})async{
  searchData=[];
  loadingSearch=true;
  http.Response res=await http.get(Uri.parse(
    'https://newsapi.org/v2/everything?q=$keyword&apiKey=bcab4ccbe2314cb48eef06d945ee8a31'
  ));
  searchData=json.decode(res.body)['articles'];
  loadingSearch=false;
  notifyListeners();
}
}
