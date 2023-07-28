import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/GetCommentsModel.dart';
import 'package:http/http.dart' as http ;
class GetCommentsModelApiScreen extends StatefulWidget {
  const GetCommentsModelApiScreen({Key? key}) : super(key: key);

  @override
  State<GetCommentsModelApiScreen> createState() => _GetCommentsModelApiScreenState();
}

class _GetCommentsModelApiScreenState extends State<GetCommentsModelApiScreen> {
  List<GetCommentsModel> getCommentList=[];
  Future<List<GetCommentsModel>> getCommentApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
    var data = jsonDecode(response.body.toString());
   if (response.statusCode==200)
     {
       for(Map i in data){
         getCommentList.add(GetCommentsModel.fromJson(i));
       }
       return getCommentList;
     }
   else {
     return getCommentList;
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Commenst Api '),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
        future: getCommentApi(),
        builder: (context,snapshot ){
            if (!snapshot.hasData)
              {
                return Text('loading');
              }
            else {
              return ListView.builder(
                  itemCount: getCommentList.length,
                  itemBuilder: (context, index ){
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Id', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          Text(getCommentList[index].email.toString()),

                      ],
                          ),
                        ),
                      ),
                    ) ;  });
            }

        }),
          ),
        ],
      ),
    );
  }
}
