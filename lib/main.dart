import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final dio = Dio();
  final endpoint1 = "http://api.sr.se/api/v2/programs?format=json&indent=true&page=2";
  final endpoint2 = 'https://api.sr.se/api/v2/scheduledepisodes?channelid=164&format=json';
  final endpoint3 = 'http://api.sr.se/api/v2/channels/164';

  void fetch() async {
  Response response;
  response = await dio.get(endpoint1);
  print(response.data['programs']);
  // The below request is the same as above.

  // response = await dio.get(
  //   '/test',
  //   queryParameters: {'id': 12, 'name': 'dio'},
  // );
  // print(response.data.toString());
}

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: Column(
          children: [
            const Text('Fetch info'),
            ElevatedButton(
              onPressed: fetch,
              child: const Text('Fetch'),
            ),
          ],
        ),
      ),
    );
  }
}
