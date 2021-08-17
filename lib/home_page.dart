import 'package:flutter/material.dart';
import 'package:testing_packages/services/http_service.dart';

import 'model/post_model.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response),
        });
  }

  void _apiCreatePost(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Post(id: 1, title: 'Muhammadrizo', body: 'Mobile Developer', userId: "1");
    _apiCreatePost(post);
  }

  void _showResponse(String javob) {
    setState(() {
      data = javob;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          data != null ? data : 'no data',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
