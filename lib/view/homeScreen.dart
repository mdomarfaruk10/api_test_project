import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:testproject/model/postModel.dart';
import 'package:testproject/network/endpoints.dart';
import 'package:testproject/service/api_service.dart';
class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {


  List<PostsModels> posttList =[];
  bool loading = true;

  Future dataload() async {
    APIService service = APIService();
    var list =await service.getAllpost();
    list.forEach((element) {
      posttList.add(element);
    });
    setState(() {
      loading = false;
    });
  }


  void initState(){
    dataload();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test project"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: posttList.length,
                itemBuilder: (BuildContext context,index){
                  return
                    ListTile(
                      title: Text(posttList[index].title.toString()),
                      subtitle: Text(posttList[index].body.toString()),
                    );
                }
            ),
          )
        ],
      ),

    );
  }
}