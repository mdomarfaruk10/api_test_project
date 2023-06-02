import 'package:testproject/model/postModel.dart';
import 'package:testproject/network/endpoints.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class APIService{
  List<PostsModels> list =[];
  Future<List<PostsModels>> getAllpost()async{
    final response = await http.get(Uri.parse(API.BASE_URL+API.getAllBlogs));
    if(response.statusCode == 200){
      var data =jsonDecode(response.body.toString());
          for(Map i in data){
            list.add(PostsModels.fromJson(i));
          }
      return list;
    }else{
      throw list;
    }
  }
}