import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

  Future<List> getData() async {
    String myUrl = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(myUrl);
    return json.decode(response.body);
  }
}

class HomeState extends State<Home> {
  var home = new Home();
  List data = [
    {
      'userId': 1,
      'id': 1,
      'title': "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      'body': "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
    },
  ];
  int mytextData1 =0;
  String mytextData2 ='';
String mytextData3 ='';
  void getMyData() async {

    data = await (home.getData());
    print(data);
    setState(() {
      mytextData1 = data[0]['id'];
      mytextData2 = data[0]['title'];
      mytextData3 = data[0]['body'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Muhammed API"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new RaisedButton(
                onPressed: getMyData,
                child: new Text('click me'),
              ),
            ),


            new Center(
              child:   new ListView.builder(
                padding: EdgeInsets.all(12.0),
                itemCount: data.length,
                  itemBuilder: (BuildContext context,int position){
                  return new ListTile(
                    title: new Text(
                      '${data[position]['title']}',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.pink),
                    ),
                    subtitle:new Text(
                    '${data[position]['body']}',
                    style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.pink,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                      child: new Text('P ${data[position]['id']}'),
                    ),
                  );
                  }
              )
              ),


          ],
        ),
      )
    );

  }
}
