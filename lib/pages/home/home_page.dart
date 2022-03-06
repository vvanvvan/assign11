import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THAI FOOD'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _handleClickButton,
              child: const Text('LOAD FOODS DATA'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 9,
                itemBuilder: (context, index){
                  return Card(
                    // In many cases, the key isn't mandatory
                    key: UniqueKey(),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('1234')),
                  );
                }

            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleClickButton() async {
    Uri url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var result = await http.get(url);

    var json = jsonDecode(result.body);
    //print(json['status']);
    List<dynamic> data = json['data'];
    print(data);

  }
}

