import 'package:flutter/services.dart';
import 'package:janson_wighting/domain/models/models.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PDF2 {
  static Future<Document> generate(c, Invoice invoice) async {
    var data = await rootBundle.load("assets/fonts/HacenTunisia.ttf");

    var arabicFont = Font.ttf(data);
    final pdf = Document();

    pdf.addPage(
      Page(
        textDirection: TextDirection.rtl,
        theme: ThemeData(
            tableCell: TextStyle(font: arabicFont, fontSize: 16),
            defaultTextStyle: TextStyle(font: arabicFont, fontSize: 12)),
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.natural,
        margin: const EdgeInsets.symmetric(vertical: 15),
        build: (context) {
          return Container(
              decoration: BoxDecoration(),
              margin: const EdgeInsets.all(22),
              child: Expanded(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Text('Ticket Serial : ${invoice.serial}'),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Table(children: [
                                      TableRow(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.full,
                                          children: [cell(100, 'وزن')]
                                              .reversed
                                              .toList())
                                    ])
                                  ]),
                              ...invoice.items.map((e) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Table(children: [
                                          TableRow(
                                              verticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .full,
                                              children: [
                                                cell(
                                                    100,
                                                    e.theoriticalWight
                                                        .toString()),
                                              ].reversed.toList())
                                        ])
                                      ])),
                              Row(children: [
                                Column(children: [
                                  SizedBox(height: 12),
                                  Text(
                                      '     تم تسليم هذا النموذج لقسم الجوده بتاريخ :  '),
                                ]),
                              ]),
                              Row(children: [
                                Column(children: [
                                  SizedBox(height: 12),
                                  Text('      ملاحظات :'),
                                ]),
                              ]),
                              Row(children: [
                                Column(children: [
                                  SizedBox(height: 12),
                                  Text('    تقرير الفنى :'),
                                ]),
                              ]),
                            ]),
                          ]))));
        },
      ),
    );
    return pdf;
  }
}

Container cell(double? l, String data) => Container(
    width: l,
    child: Center(child: Text(data)),
    decoration: BoxDecoration(border: Border.all()));
