import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:svradio_flutterapp/app_widgets/channel_widget.dart';
import 'package:svradio_flutterapp/app_widgets/schedule_container.dart';
import 'package:svradio_flutterapp/classes/channel.dart';
import './test_folder/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dio = Dio();

  Map<String, dynamic> channelsMap = {};
  List<ChannelType> channels = [];

  void fetch() async {
    Response response;
    response = await dio.get(allChannelsURL1);
    Map<String, dynamic> data = response.data;
    for (var i = 0; i < data['channels'].length; i++) {
      var item = ChannelType(
        name: data['channels'][i]['name'],
        id: data['channels'][i]['id'],
        tagline: data['channels'][i]['tagline'],
        color: data['channels'][i]['color'],
        image: data['channels'][i]['image'],
      );
      setState(() {
        channels.add(item);
      });
    }
  }

  void goToStart() {
    setState(() {
      channels.clear();
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SverigesRadio'),
        ),
        body: channels.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: goToStart,
                        child: const Text('Back'),
                      ),
                      const Text('Channels:'),
                    ],
                  ),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: channels.length,
                      itemBuilder: (context, index) {
                        return ChannelWidget(item: channels[index]);
                      },
                    ),
                  ),
                  ScheduleContainer(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const Text('List not full'),
                        ElevatedButton(
                          onPressed: fetch,
                          child: const Text('Enter'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
