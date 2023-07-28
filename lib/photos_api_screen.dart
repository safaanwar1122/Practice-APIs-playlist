import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/PhotosModel.dart';
import 'package:http/http.dart' as http;

class PhotosAPIScreen extends StatefulWidget {
  const PhotosAPIScreen({Key? key}) : super(key: key);

  @override
  State<PhotosAPIScreen> createState() => _PhotosAPIScreenState();
}

class _PhotosAPIScreenState extends State<PhotosAPIScreen> {
  List<PhotosModel> photosList = [];
  Future<List<PhotosModel>> photosApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        photosList.add(PhotosModel.fromJson(i));
      }
      return photosList;
    } else {}
    return photosList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos API Model '),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: photosApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: photosList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            // leading: CircleAvatar(
                            //   backgroundImage: NetworkImage(snapshot.data![index].thumbnailUrl.toString()),
                            // ),
                            subtitle: Text(snapshot.data![index].title.toString()),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
