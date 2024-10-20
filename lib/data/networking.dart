// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:janson_wighting/domain/models/models.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

String ip = '192.168.1.225';
bool isserveronline = false;

Stream<bool> isServerOnline() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    Uri uri = Uri.http(
      '$ip:8080',
    );
    try {
      var response = await http.get(uri);
      yield response.statusCode == 200;
      isserveronline = true;
      print("server is online= $isserveronline");
    } catch (e) {
      print("server is ofline= $isserveronline");

      yield false;
      isserveronline = false;
    }
  }
}

Future<bool> isServerOnline2() async {
  bool v = false;
  Uri uri = Uri.http(
    '$ip:8080',
  );
  try {
    var response = await http.get(uri);
    response.statusCode == 200 ? v = true : v = false;
  } catch (e) {}
  return v;
}

bool done = false;
late WebSocketChannel recordChannel;

class ServerDB extends ChangeNotifier {
  Future<void> SendPending_GetAll_ConnectAndListenchannels() async {
    print("start connectinf");
    Uri a = Uri.http('$ip:8080', '/biscol');
    while (done == false) {
      await Future.delayed(const Duration(seconds: 1));
      if (isserveronline == true) {
        //sen pending
        for (var element in Hive.box("pendingRecords").values) {
          await http.put(a, body: element).then((e) {
            if (e.statusCode == 200) {
              Hive.box("pendingRecords").delete(
                  WieghtTecketMOdel.fromJson(element)
                      .wightTecket_ID
                      .toString());
            }
          });
        }
        // recevie updates
        Hive.box("records").clear();
        await http
            .get(
          a,
        )
            .then((onValue) {
          for (var element in json.decode(onValue.body) as List) {
            final item = WieghtTecketMOdel.fromMap(element);
            Hive.box("records")
                .put(item.wightTecket_ID.toString(), item.toJson());
          }
        });

        done = true;
        connect_listen_chanel();
      }
    }
  }

  connect_listen_chanel() {
    Uri a = Uri.parse('ws://$ip:8080/biscol/ws')
        .replace(queryParameters: {'username': "biscol PC"});

    recordChannel = WebSocketChannel.connect(a);

    //listen to channel
    recordChannel.stream.forEach((u) {
      WieghtTecketMOdel item = WieghtTecketMOdel.fromJson(u);
      Hive.box("records").put(item.wightTecket_ID.toString(), u);
      notifyListeners();
      print("get channel $item");
    });
    reconnectChannelAndSendPeinding();
  }

  Future<void> reconnectChannelAndSendPeinding() async {
    // reconnect channel
    while (true) {
      await Future.delayed(Duration(milliseconds: 1000));
      if (isserveronline == true) {
        for (var element in Hive.box("pendingRecords").values) {
          recordChannel.sink.add(element);
          Hive.box("pendingRecords").delete(
              WieghtTecketMOdel.fromJson(element).wightTecket_ID.toString());
        }
      }
      final i = await isServerOnline2();
      print("object");
      if (recordChannel.closeCode != null && i == true) {
        print("reconnte");
        connect_listen_chanel();
        await Future.delayed(const Duration(seconds: 2));
        //sen pending
        if (isserveronline == true) {
          for (var element in Hive.box("pendingRecords").values) {
            recordChannel.sink.add(element);
            Hive.box("pendingRecords").delete(
                WieghtTecketMOdel.fromJson(element).wightTecket_ID.toString());
          }
        }
      }
    }
  }
}

Future<String> postimage(String imageID, List<int> image) async {
  String s = String.fromCharCodes(Uint8List.fromList(image));
  Uri uri = Uri.http('192.168.1.225:8080', '/i')
      .replace(queryParameters: {'imageid': imageID});
  var response = await http.post(uri, body: s);
  return response.body;
}

//  sendImage(WieghtTecketMOdel e) {
//  e.synced = true;
//       if (e.firstShotpiccam1.isNotEmpty) {
//         String id = DateTime.now().microsecondsSinceEpoch.toString();
//         postimage(id, e.firstShotpiccam1);
//         e.firstShotpiccam1.clear();
//         e.firstShotpiccam1Adress = id;
//       }
//       if (e.firstShotpiccam2.isNotEmpty) {
//         String id = DateTime.now().microsecondsSinceEpoch.toString();
//         postimage(id, e.firstShotpiccam2);
//         e.firstShotpiccam2.clear();
//         e.firstShotpiccam2Adress = id;
//       }

//       if (e.secondShotpiccam1.isNotEmpty) {
//         String id = DateTime.now().microsecondsSinceEpoch.toString();
//         postimage(id, e.secondShotpiccam1);
//         e.secondShotpiccam1.clear();
//         e.secondShotpiccam1Adress = id;
//       }
//       if (e.secondShotpiccam2.isNotEmpty) {
//         String id = DateTime.now().microsecondsSinceEpoch.toString();
//         postimage(id, e.secondShotpiccam2);
//         e.secondShotpiccam2.clear();
//         e.secondShotpiccam2Adress = id;
//       }
// }

Future<String> getImageByID(int imageID) async {
  Uri uri = Uri.http('192.168.1.225:8080', '/biscool')
      .replace(queryParameters: {'imageid': '$imageID'});
  var response = await http.get(uri);
  return response.body;
}

Future<String> getInvoiceByNumber(int num) async {
  Uri uri = Uri.http('192.168.1.225:8080', '/invoices')
      .replace(queryParameters: {'num': '$num'});
  var response = await http.get(uri);
  return response.body;
}
