import 'package:flutter/material.dart';
import 'package:svradio_flutterapp/classes/channel.dart';

class ChannelWidget extends StatelessWidget {
  final ChannelType item;

  const ChannelWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // if(item !=null){}
    return SizedBox(
        width: double.infinity,
        height: 160,
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  image: NetworkImage(item.image ?? 'img not found'),
                  height: 70,
                  width: 70,
                ),
                Text(item.name ?? 'no name found')
              ],
            ),
            Text(item.tagline ?? 'tagline not found')
          ],
        ));
  }
}
