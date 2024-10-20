import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:janson_wighting/data/providers.dart';
import 'package:provider/provider.dart';

class CamerasAsImages extends StatelessWidget {
  const CamerasAsImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: timedCounter(101),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              context.read<Hivecontroller>().cam1 = snapshot.data;
              return Image.memory(
                snapshot.data,
                width: MediaQuery.of(context).size.width * .22,
                height: 230,
                fit: BoxFit.fill,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        StreamBuilder(
          stream: timedCounter(202),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              context.read<Hivecontroller>().cam2 = snapshot.data;
              return Image.memory(
                snapshot.data,
                width: MediaQuery.of(context).size.width * .22,
                height: 230,
                fit: BoxFit.fill,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

Stream<Uint8List> timedCounter(int x) async* {
  final url = Uri.parse(
      'http://admin:Admin%40123@192.168.1.90/ISAPI/Streaming/channels/$x/picture'); //Repclace Your Endpoint
  final headers = {
    'Accept': '*/*',
    'Cache-Control': 'no-cache',
    'Accept-Encoding': 'gzip, deflate, br',
    'Content-Type': 'image/jpeg',
    'Authorization': 'Basic YWRtaW46QWRtaW5AMTIz'
  };

  while (true) {
    final response = await http.get(
      url,
      headers: headers,
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    yield response.bodyBytes;
  }
}
