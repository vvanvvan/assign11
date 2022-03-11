import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = <dynamic>[];
  // List<int> colorCodes = <int>[900,800,700,600,500,400,300,200,100];

  dynamic info;
  final List<int> price = <int>[];
  final List<String> image =  <String>[];
  final List<String> name =  <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar:  AppBar(
          title: const Text('กาตุ่ย Delivery'),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                      setState(() {
                        _handleClickButton();
                      });
                  },
                  child: const Text('LOAD FOODS DATA'),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network('${image[index]}',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        title: Text(name[index] , style: const TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                        subtitle: Text('${price[index].toString()} บาท' , style: const TextStyle(fontSize: 14)),

                        onTap: () {
                          SnackBar snackBar = SnackBar(
                              content: Text("Tapped : ${index + 1}")
                          );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    );
                  }
              ),
            ),
          ],
        )
    );
  }
  _handleClickButton() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var result = await http.get(url);
    var json = jsonDecode(result.body);
    image.clear();
    name.clear();
    price.clear();
    data = json['data'];
    for(int i=0;i<data.length;++i){
      info = data[i];
      image.add(info['image']);
      name.add(info['name']);
      price.add(info['price']);
    }

  }
}