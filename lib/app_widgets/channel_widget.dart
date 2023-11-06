import 'package:flutter/material.dart';
import 'package:svradio_flutterapp/classes/channel.dart';
import 'package:hexcolor/hexcolor.dart';

class ChannelWidget extends StatelessWidget {
  final ChannelType item;

  const ChannelWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // if(item !=null){}
    return Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              alignment: Alignment.topCenter,
              image: NetworkImage(item.image ?? 'img not found'),
              height: 70,
              width: 70,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, 
                  borderRadius: BorderRadius.circular(20)),
              width: 270,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      style: TextStyle(
                        color: HexColor(item.color ?? ''),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      item.name ?? 'no name found'),
                  Text(
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      wordSpacing: 5,
                    ),
                    item.tagline ?? 'tagline not found',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
