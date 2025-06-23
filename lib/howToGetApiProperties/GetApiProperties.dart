import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetApiProperties extends StatefulWidget {
  const GetApiProperties({super.key});

  @override
  State<GetApiProperties> createState() => _GetApiPropertiesState();
}

class _GetApiPropertiesState extends State<GetApiProperties> {
  List <dynamic> post=[];
  Future fetchData()async{
      final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if(response.statusCode==200){
        print(response.statusCode);
        print(response.body.runtimeType);
        print(response.body.length);
        //print(response.body);

        final jsonData=jsonDecode(response.body);
        post=jsonData;
        print(post.length);
        print(post.runtimeType);
       // print(post[0]);
      }
      else{
        print("Something wrong this code");
        print(response.statusCode);

      }
     // print(post);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.cyanAccent,
    appBar: AppBar(title: Text("Get Api Properties",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: post.length,
            itemBuilder: (context,index){
          return Text( index.toString());
          //print(post);
        }),
      ),
    );
  }
}
