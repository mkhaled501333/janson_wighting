// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WieghtTecketMOdel {
  int wightTecket_ID;
  int wightTecket_serial;
  int stockRequsition_ID;
  int stockRequsition_serial;
  int carNum;
  String customerName;
  String driverName;
  String prodcutName;
  String notes;
  double firstShot;
  double secondShot;
  double totalWeight;
  List<int> firstShotpiccam1;
  List<int> firstShotpiccam2;
  List<int> secondShotpiccam1;
  List<int> secondShotpiccam2;
  String firstShotpiccam1Adress;
  String firstShotpiccam2Adress;
  String secondShotpiccam1Adress;
  String secondShotpiccam2Adress;
  List<ActionModel> actions;
  bool synced;
  int lastupdated;
  WieghtTecketMOdel({
    required this.wightTecket_ID,
    required this.wightTecket_serial,
    required this.stockRequsition_ID,
    required this.stockRequsition_serial,
    required this.carNum,
    required this.customerName,
    required this.driverName,
    required this.prodcutName,
    required this.notes,
    required this.firstShot,
    required this.secondShot,
    required this.totalWeight,
    required this.firstShotpiccam1,
    required this.firstShotpiccam2,
    required this.secondShotpiccam1,
    required this.secondShotpiccam2,
    required this.firstShotpiccam1Adress,
    required this.firstShotpiccam2Adress,
    required this.secondShotpiccam1Adress,
    required this.secondShotpiccam2Adress,
    required this.actions,
    required this.synced,
    required this.lastupdated,
  });

  WieghtTecketMOdel copyWith({
    int? wightTecket_ID,
    int? wightTecket_serial,
    int? stockRequsition_ID,
    int? stockRequsition_serial,
    int? carNum,
    String? customerName,
    String? driverName,
    String? prodcutName,
    String? notes,
    double? firstShot,
    double? secondShot,
    double? totalWeight,
    List<int>? firstShotpiccam1,
    List<int>? firstShotpiccam2,
    List<int>? secondShotpiccam1,
    List<int>? secondShotpiccam2,
    String? firstShotpiccam1Adress,
    String? firstShotpiccam2Adress,
    String? secondShotpiccam1Adress,
    String? secondShotpiccam2Adress,
    List<ActionModel>? actions,
    bool? synced,
    int? lastupdated,
  }) {
    return WieghtTecketMOdel(
      wightTecket_ID: wightTecket_ID ?? this.wightTecket_ID,
      wightTecket_serial: wightTecket_serial ?? this.wightTecket_serial,
      stockRequsition_ID: stockRequsition_ID ?? this.stockRequsition_ID,
      stockRequsition_serial:
          stockRequsition_serial ?? this.stockRequsition_serial,
      carNum: carNum ?? this.carNum,
      customerName: customerName ?? this.customerName,
      driverName: driverName ?? this.driverName,
      prodcutName: prodcutName ?? this.prodcutName,
      notes: notes ?? this.notes,
      firstShot: firstShot ?? this.firstShot,
      secondShot: secondShot ?? this.secondShot,
      totalWeight: totalWeight ?? this.totalWeight,
      firstShotpiccam1: firstShotpiccam1 ?? this.firstShotpiccam1,
      firstShotpiccam2: firstShotpiccam2 ?? this.firstShotpiccam2,
      secondShotpiccam1: secondShotpiccam1 ?? this.secondShotpiccam1,
      secondShotpiccam2: secondShotpiccam2 ?? this.secondShotpiccam2,
      firstShotpiccam1Adress:
          firstShotpiccam1Adress ?? this.firstShotpiccam1Adress,
      firstShotpiccam2Adress:
          firstShotpiccam2Adress ?? this.firstShotpiccam2Adress,
      secondShotpiccam1Adress:
          secondShotpiccam1Adress ?? this.secondShotpiccam1Adress,
      secondShotpiccam2Adress:
          secondShotpiccam2Adress ?? this.secondShotpiccam2Adress,
      actions: actions ?? this.actions,
      synced: synced ?? this.synced,
      lastupdated: lastupdated ?? this.lastupdated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wightTecket_ID': wightTecket_ID,
      'wightTecket_serial': wightTecket_serial,
      'stockRequsition_ID': stockRequsition_ID,
      'stockRequsition_serial': stockRequsition_serial,
      'carNum': carNum,
      'customerName': customerName,
      'driverName': driverName,
      'prodcutName': prodcutName,
      'notes': notes,
      'firstShot': firstShot,
      'secondShot': secondShot,
      'totalWeight': totalWeight,
      'firstShotpiccam1': firstShotpiccam1,
      'firstShotpiccam2': firstShotpiccam2,
      'secondShotpiccam1': secondShotpiccam1,
      'secondShotpiccam2': secondShotpiccam2,
      'firstShotpiccam1Adress': firstShotpiccam1Adress,
      'firstShotpiccam2Adress': firstShotpiccam2Adress,
      'secondShotpiccam1Adress': secondShotpiccam1Adress,
      'secondShotpiccam2Adress': secondShotpiccam2Adress,
      'actions': actions.map((x) => x.toMap()).toList(),
      'synced': synced,
      'lastupdated': lastupdated,
    };
  }

  factory WieghtTecketMOdel.fromMap(Map<String, dynamic> map) {
    return WieghtTecketMOdel(
      wightTecket_ID: map['wightTecket_ID'] as int,
      wightTecket_serial: map['wightTecket_serial'] as int,
      stockRequsition_ID: map['stockRequsition_ID'] as int,
      stockRequsition_serial: map['stockRequsition_serial'] as int,
      carNum: map['carNum'] as int,
      customerName: map['customerName'] as String,
      driverName: map['driverName'] as String,
      prodcutName: map['prodcutName'] as String,
      notes: map['notes'] as String,
      firstShot: map['firstShot'] as double,
      secondShot: map['secondShot'] as double,
      totalWeight: map['totalWeight'] as double,
      firstShotpiccam1:
          List<int>.from((map['firstShotpiccam1'] as List<dynamic>)),
      firstShotpiccam2:
          List<int>.from((map['firstShotpiccam2'] as List<dynamic>)),
      secondShotpiccam1:
          List<int>.from((map['secondShotpiccam1'] as List<dynamic>)),
      secondShotpiccam2:
          List<int>.from((map['secondShotpiccam2'] as List<dynamic>)),
      firstShotpiccam1Adress: map['firstShotpiccam1Adress'] as String,
      firstShotpiccam2Adress: map['firstShotpiccam2Adress'] as String,
      secondShotpiccam1Adress: map['secondShotpiccam1Adress'] as String,
      secondShotpiccam2Adress: map['secondShotpiccam2Adress'] as String,
      actions: List<ActionModel>.from(
        (map['actions'] as List<dynamic>).map<ActionModel>(
          (x) => ActionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      synced: map['synced'] as bool,
      lastupdated: map['lastupdated'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WieghtTecketMOdel.fromJson(String source) =>
      WieghtTecketMOdel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WieghtTecketMOdel(wightTecket_ID: $wightTecket_ID, wightTecket_serial: $wightTecket_serial, stockRequsition_ID: $stockRequsition_ID, stockRequsition_serial: $stockRequsition_serial, carNum: $carNum, customerName: $customerName, driverName: $driverName, prodcutName: $prodcutName, notes: $notes, firstShot: $firstShot, secondShot: $secondShot, totalWeight: $totalWeight, firstShotpiccam1: $firstShotpiccam1, firstShotpiccam2: $firstShotpiccam2, secondShotpiccam1: $secondShotpiccam1, secondShotpiccam2: $secondShotpiccam2, firstShotpiccam1Adress: $firstShotpiccam1Adress, firstShotpiccam2Adress: $firstShotpiccam2Adress, secondShotpiccam1Adress: $secondShotpiccam1Adress, secondShotpiccam2Adress: $secondShotpiccam2Adress, actions: $actions, synced: $synced, lastupdated: $lastupdated)';
  }

  @override
  bool operator ==(covariant WieghtTecketMOdel other) {
    if (identical(this, other)) return true;

    return other.wightTecket_ID == wightTecket_ID &&
        other.wightTecket_serial == wightTecket_serial &&
        other.stockRequsition_ID == stockRequsition_ID &&
        other.stockRequsition_serial == stockRequsition_serial &&
        other.carNum == carNum &&
        other.customerName == customerName &&
        other.driverName == driverName &&
        other.prodcutName == prodcutName &&
        other.notes == notes &&
        other.firstShot == firstShot &&
        other.secondShot == secondShot &&
        other.totalWeight == totalWeight &&
        listEquals(other.firstShotpiccam1, firstShotpiccam1) &&
        listEquals(other.firstShotpiccam2, firstShotpiccam2) &&
        listEquals(other.secondShotpiccam1, secondShotpiccam1) &&
        listEquals(other.secondShotpiccam2, secondShotpiccam2) &&
        other.firstShotpiccam1Adress == firstShotpiccam1Adress &&
        other.firstShotpiccam2Adress == firstShotpiccam2Adress &&
        other.secondShotpiccam1Adress == secondShotpiccam1Adress &&
        other.secondShotpiccam2Adress == secondShotpiccam2Adress &&
        listEquals(other.actions, actions) &&
        other.synced == synced &&
        other.lastupdated == lastupdated;
  }

  @override
  int get hashCode {
    return wightTecket_ID.hashCode ^
        wightTecket_serial.hashCode ^
        stockRequsition_ID.hashCode ^
        stockRequsition_serial.hashCode ^
        carNum.hashCode ^
        customerName.hashCode ^
        driverName.hashCode ^
        prodcutName.hashCode ^
        notes.hashCode ^
        firstShot.hashCode ^
        secondShot.hashCode ^
        totalWeight.hashCode ^
        firstShotpiccam1.hashCode ^
        firstShotpiccam2.hashCode ^
        secondShotpiccam1.hashCode ^
        secondShotpiccam2.hashCode ^
        firstShotpiccam1Adress.hashCode ^
        firstShotpiccam2Adress.hashCode ^
        secondShotpiccam1Adress.hashCode ^
        secondShotpiccam2Adress.hashCode ^
        actions.hashCode ^
        synced.hashCode ^
        lastupdated.hashCode;
  }
}

class ActionModel {
  String action;
  String who;
  DateTime when;
  ActionModel({
    required this.action,
    required this.who,
    required this.when,
  });

  ActionModel copyWith({
    String? action,
    String? who,
    DateTime? when,
  }) {
    return ActionModel(
      action: action ?? this.action,
      who: who ?? this.who,
      when: when ?? this.when,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'action': action,
      'who': who,
      'when': when.millisecondsSinceEpoch,
    };
  }

  factory ActionModel.fromMap(Map<String, dynamic> map) {
    return ActionModel(
      action: map['action'] as String,
      who: map['who'] as String,
      when: DateTime.fromMillisecondsSinceEpoch(map['when'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ActionModel.fromJson(String source) =>
      ActionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ActionModel(action: $action, who: $who, when: $when)';

  @override
  bool operator ==(covariant ActionModel other) {
    if (identical(this, other)) return true;

    return other.action == action && other.who == who && other.when == when;
  }

  @override
  int get hashCode => action.hashCode ^ who.hashCode ^ when.hashCode;
}

class DriverModel {
  int ID;
  String drivername;
  String companyname;
  int carNum;
  DriverModel({
    required this.ID,
    required this.drivername,
    required this.companyname,
    required this.carNum,
  });

  DriverModel copyWith({
    int? ID,
    String? drivername,
    String? companyname,
    int? carNum,
  }) {
    return DriverModel(
      ID: ID ?? this.ID,
      drivername: drivername ?? this.drivername,
      companyname: companyname ?? this.companyname,
      carNum: carNum ?? this.carNum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': ID,
      'drivername': drivername,
      'companyname': companyname,
      'carNum': carNum,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      ID: map['ID'] as int,
      drivername: map['drivername'] as String,
      companyname: map['companyname'] as String,
      carNum: map['carNum'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverModel(ID: $ID, drivername: $drivername, companyname: $companyname, carNum: $carNum)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.ID == ID &&
        other.drivername == drivername &&
        other.companyname == companyname &&
        other.carNum == carNum;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
        drivername.hashCode ^
        companyname.hashCode ^
        carNum.hashCode;
  }
}

class Invoice {
  final int invoice_ID;
  final int serial;
  final String driverName;
  final int carNumber;
  final String dispatcher;
  final String notes;
  final List<ActionModel> actions;
  final List<InvoiceItem> items;
  int updatedat;
  Invoice({
    required this.invoice_ID,
    required this.serial,
    required this.driverName,
    required this.carNumber,
    required this.dispatcher,
    required this.notes,
    required this.actions,
    required this.items,
    required this.updatedat,
  });

  Invoice copyWith({
    int? invoice_ID,
    int? serial,
    String? driverName,
    int? carNumber,
    String? dispatcher,
    String? notes,
    List<ActionModel>? actions,
    List<InvoiceItem>? items,
    int? updatedat,
  }) {
    return Invoice(
      invoice_ID: invoice_ID ?? this.invoice_ID,
      serial: serial ?? this.serial,
      driverName: driverName ?? this.driverName,
      carNumber: carNumber ?? this.carNumber,
      dispatcher: dispatcher ?? this.dispatcher,
      notes: notes ?? this.notes,
      actions: actions ?? this.actions,
      items: items ?? this.items,
      updatedat: updatedat ?? this.updatedat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoice_ID': invoice_ID,
      'serial': serial,
      'driverName': driverName,
      'carNumber': carNumber,
      'dispatcher': dispatcher,
      'notes': notes,
      'actions': actions.map((x) => x.toMap()).toList(),
      'items': items.map((x) => x.toMap()).toList(),
      'updatedat': updatedat,
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      invoice_ID: map['invoice_ID'] as int,
      serial: map['serial'] as int,
      driverName: map['driverName'] as String,
      carNumber: map['carNumber'] as int,
      dispatcher: map['dispatcher'] as String,
      notes: map['notes'] as String,
      actions: List<ActionModel>.from(
        (map['actions'] as List<dynamic>).map<ActionModel>(
          (x) => ActionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      items: List<InvoiceItem>.from(
        (map['items'] as List<dynamic>).map<InvoiceItem>(
          (x) => InvoiceItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      updatedat: map['updatedat'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) =>
      Invoice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Invoice(invoice_ID: $invoice_ID, serial: $serial, driverName: $driverName, carNumber: $carNumber, dispatcher: $dispatcher, notes: $notes, actions: $actions, items: $items, updatedat: $updatedat)';
  }

  @override
  int get hashCode {
    return invoice_ID.hashCode ^
        serial.hashCode ^
        driverName.hashCode ^
        carNumber.hashCode ^
        dispatcher.hashCode ^
        notes.hashCode ^
        actions.hashCode ^
        items.hashCode ^
        updatedat.hashCode;
  }
}

class InvoiceItem {
  int invoiceItem_ID;
  int finalprodcut_ID;
  double lenth;
  double width;
  double hight;
  String color;
  double density;
  String type;
  double price;
  String customer;
  int quantity;
  double theoriticalWight;
  double reallWight;
  InvoiceItem({
    required this.invoiceItem_ID,
    required this.finalprodcut_ID,
    required this.lenth,
    required this.width,
    required this.hight,
    required this.color,
    required this.density,
    required this.type,
    required this.price,
    required this.customer,
    required this.quantity,
    required this.theoriticalWight,
    required this.reallWight,
  });

  InvoiceItem copyWith({
    int? invoiceItem_ID,
    int? finalprodcut_ID,
    double? lenth,
    double? width,
    double? hight,
    String? color,
    double? density,
    String? type,
    double? price,
    String? customer,
    int? quantity,
    double? theoriticalWight,
    double? reallWight,
  }) {
    return InvoiceItem(
      invoiceItem_ID: invoiceItem_ID ?? this.invoiceItem_ID,
      finalprodcut_ID: finalprodcut_ID ?? this.finalprodcut_ID,
      lenth: lenth ?? this.lenth,
      width: width ?? this.width,
      hight: hight ?? this.hight,
      color: color ?? this.color,
      density: density ?? this.density,
      type: type ?? this.type,
      price: price ?? this.price,
      customer: customer ?? this.customer,
      quantity: quantity ?? this.quantity,
      theoriticalWight: theoriticalWight ?? this.theoriticalWight,
      reallWight: reallWight ?? this.reallWight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoiceItem_ID': invoiceItem_ID,
      'finalprodcut_ID': finalprodcut_ID,
      'lenth': lenth,
      'width': width,
      'hight': hight,
      'color': color,
      'density': density,
      'type': type,
      'price': price,
      'customer': customer,
      'quantity': quantity,
      'theoriticalWight': theoriticalWight,
      'reallWight': reallWight,
    };
  }

  factory InvoiceItem.fromMap(Map<String, dynamic> map) {
    return InvoiceItem(
      invoiceItem_ID: map['invoiceItem_ID'] as int,
      finalprodcut_ID: map['finalprodcut_ID'] as int,
      lenth: map['lenth'] as double,
      width: map['width'] as double,
      hight: map['hight'] as double,
      color: map['color'] as String,
      density: map['density'] as double,
      type: map['type'] as String,
      price: map['price'] as double,
      customer: map['customer'] as String,
      quantity: map['quantity'] as int,
      theoriticalWight: map['theoriticalWight'] as double,
      reallWight: map['reallWight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceItem.fromJson(String source) =>
      InvoiceItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InvoiceItem(invoiceItem_ID: $invoiceItem_ID, finalprodcut_ID: $finalprodcut_ID, lenth: $lenth, width: $width, hight: $hight, color: $color, density: $density, type: $type, price: $price, customer: $customer, quantity: $quantity, theoriticalWight: $theoriticalWight, reallWight: $reallWight)';
  }

  @override
  bool operator ==(covariant InvoiceItem other) {
    if (identical(this, other)) return true;

    return other.invoiceItem_ID == invoiceItem_ID &&
        other.finalprodcut_ID == finalprodcut_ID &&
        other.lenth == lenth &&
        other.width == width &&
        other.hight == hight &&
        other.color == color &&
        other.density == density &&
        other.type == type &&
        other.price == price &&
        other.customer == customer &&
        other.quantity == quantity &&
        other.theoriticalWight == theoriticalWight &&
        other.reallWight == reallWight;
  }

  @override
  int get hashCode {
    return invoiceItem_ID.hashCode ^
        finalprodcut_ID.hashCode ^
        lenth.hashCode ^
        width.hashCode ^
        hight.hashCode ^
        color.hashCode ^
        density.hashCode ^
        type.hashCode ^
        price.hashCode ^
        customer.hashCode ^
        quantity.hashCode ^
        theoriticalWight.hashCode ^
        reallWight.hashCode;
  }
}
