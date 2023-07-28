import 'package:flutter/material.dart';

import 'get_api.dart';
import 'get_comments_model_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const GetCommentsModelApiScreen(),
      // home: const GetApiScreen (),
    );
  }
}
