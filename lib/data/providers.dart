// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:janson_wighting/domain/enums.dart';
import 'package:janson_wighting/domain/models/models.dart';
import 'package:janson_wighting/data/networking.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ImcomingValueporvider extends ChangeNotifier {
  var port = SerialPort('COM1');
  initport() {
    port.config.baudRate = 9600;
    port.config.bits = 8;
    port.config.parity = SerialPortParity.none;
    port.config.stopBits = 1;
    port.config.xonXoff = 0;
    port.config.rts = 1;
    port.config.dtr = 1;
    port.config.cts = 0;
    port.config.dsr = 0;
    port.openRead();
  }

  var nowValu = "0";

  stream() {
    SerialPortReader(port).stream.listen((v) {
      var a = utf8.decode(v).replaceAll(RegExp(r'[^0-9]'), '');
      if (a != '' && a != nowValu) {
        nowValu = a;
        notifyListeners();
      }
    });
  }

  Refrech_UI() {
    notifyListeners();
  }
}

String ip = '';
bool initHiveDone = false;
bool getupdatesinitionlized = false;
Map<String, WieghtTecketMOdel> allrecords = <String, WieghtTecketMOdel>{};
late WebSocketChannel channel;

class Hivecontroller extends ServerDB {
  WieghtTecketMOdel? temprecord;
  String v = '';
  bool canedit1 = true;
  bool canedit2 = true;
  TextEditingController carnumcontroller = TextEditingController();
  TextEditingController drivernamecontroller = TextEditingController();
  TextEditingController customercontroller = TextEditingController();
  TextEditingController itemcontroller = TextEditingController();
  TextEditingController finalProdcutStockreqSerial = TextEditingController();
  TextEditingController notescontroller = TextEditingController();
  bool channelConectioninitionlized = false;
  bool sendPendigTicketsinitionlized = false;
  bool isServerOnline = false;

  clearfields() {
    v = '';
    carnumcontroller.clear();
    drivernamecontroller.clear();
    customercontroller.clear();
    itemcontroller.clear();
    notescontroller.clear();
    notifyListeners();
  }

  initHive() async {
    var path = Directory.current.path;
    Hive.init(path);
    //open box and assign all its values to map of values
    await Hive.openBox(
      'records',
      compactionStrategy: (entries, deletedEntries) => false,
    ).then((g) async {
      for (var v in g.values) {
        final val = WieghtTecketMOdel.fromJson(v);
        allrecords.addAll({val.wightTecket_ID.toString(): val});
      }
      Refrech_UI();
      // Hive.box('records').watch().listen((b) {
      //   print("ttttttttttttttt ${b.value}");
      //   final val = WieghtTecketMOdel.fromJson(b.value);
      //   allrecords.addAll({b.key: val});
      //   notifyListeners();
      // });
    });
    await Hive.openBox(
      'pendingRecords',
      compactionStrategy: (entries, deletedEntries) => false,
    );

    initHiveDone = true;
  }

  bool x = false;
  bool y = false;
  Uint8List? cam1;
  Uint8List? cam2;

  addNewRecord() {
    clearfields();
    var record = WieghtTecketMOdel(
        lastupdated: DateTime.now().microsecondsSinceEpoch,
        synced: false,
        wightTecket_ID: DateTime.now().microsecondsSinceEpoch,
        wightTecket_serial: allrecords.isEmpty
            ? 1
            : allrecords.values
                    .sortedBy<num>((p) => p.wightTecket_serial)
                    .last
                    .wightTecket_serial +
                1,
        stockRequsition_ID: 0,
        stockRequsition_serial: 0,
        carNum: 0,
        customerName: '',
        driverName: '',
        prodcutName: '',
        notes: '',
        firstShot: 0,
        secondShot: 0,
        totalWeight: 0,
        actions: [WhigtTecketAction.create_newTicket.add],
        firstShotpiccam1: [],
        firstShotpiccam2: [],
        secondShotpiccam1: [],
        secondShotpiccam2: [],
        firstShotpiccam1Adress: '',
        firstShotpiccam2Adress: '',
        secondShotpiccam1Adress: '',
        secondShotpiccam2Adress: '');
    temprecord = record;
    Hive.box('records').put(record.wightTecket_ID.toString(), record.toJson());
    Hive.box('pendingRecords')
        .put(record.wightTecket_ID.toString(), record.toJson());
    allrecords.addAll({record.wightTecket_ID.toString(): record});
    notifyListeners();
  }

  FillRecord(WieghtTecketMOdel r) {
    temprecord = r;
    carnumcontroller.text = r.carNum.toString();
    drivernamecontroller.text = r.driverName;
    customercontroller.text = r.customerName;
    itemcontroller.text = r.prodcutName;
    notescontroller.text = r.notes;
    finalProdcutStockreqSerial.text = r.stockRequsition_serial.toString();
    notifyListeners();
  }

  updateRecord(WieghtTecketMOdel record) {
    record.synced = false;
    record.lastupdated = DateTime.now().microsecondsSinceEpoch;
    Hive.box('records').put(record.wightTecket_ID.toString(), record.toJson());
    Hive.box('pendingRecords')
        .put(record.wightTecket_ID.toString(), record.toJson());
    allrecords.addAll({record.wightTecket_ID.toString(): record});
    notifyListeners();
  }

  removeRecord(WieghtTecketMOdel record) {
    record.synced = false;
    record.lastupdated = DateTime.now().microsecondsSinceEpoch;

    Hive.box('records').put(record.wightTecket_ID.toString(), record.toJson());
    Hive.box('pendingRecords')
        .put(record.wightTecket_ID.toString(), record.toJson());
    allrecords.addAll({record.wightTecket_ID.toString(): record});
    notifyListeners();
  }

  Refrech_UI() {
    notifyListeners();
  }

  List<String> selectedCarNum = [];
  List<String> selectedDrivers = [];
  List<String> selectedcustomerName = [];
  List<String> selectedProdcutName = [];
  String selectedReport = '';
  String archived = 'غير محزوف';
  DateTime? pickedDateFrom;
  DateTime? pickedDateTO;
  List<DateTime> AllDatesOfOfData() {
    return allrecords.values
        .expand((e) => e.actions)
        .map((d) => d.when)
        .toList();
  }
}
