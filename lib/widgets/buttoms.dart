// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/utils/app.dart';
import 'package:janson_wighting/domain/enums.dart';
// import 'package:janson_wighting/domain/models/models.dart';
import 'package:janson_wighting/data/providers.dart';
import 'package:janson_wighting/widgets/%D8%A8%D9%8A%D8%A7%D9%86%D8%A7%D8%AA%20%D8%A7%D9%84%D9%88%D8%B2%D9%86%20%D9%88%20%D8%A7%D9%84%D8%AA%D8%B2%D9%83%D8%B1%D9%87.dart';
// import 'package:janson_wighting/widgets/pdf2.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class buttoms extends StatelessWidget {
  const buttoms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Gap(9),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {
              context.read<Hivecontroller>().canedit1 = true;
              context.read<Hivecontroller>().canedit2 = true;
              context.read<Hivecontroller>().addNewRecord();
            },
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'وزنة جديدة',
                style: TextStyle(fontSize: 18),
              ),
            )),
        const Gap(9),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                var t = context.read<Hivecontroller>().temprecord;
                if (t != null) {
                  t.carNum = context
                      .read<Hivecontroller>()
                      .carnumcontroller
                      .text
                      .to_int();
                  t.driverName =
                      context.read<Hivecontroller>().drivernamecontroller.text;
                  t.customerName =
                      context.read<Hivecontroller>().customercontroller.text;
                  t.prodcutName =
                      context.read<Hivecontroller>().itemcontroller.text;
                  t.notes = context.read<Hivecontroller>().notescontroller.text;
                  t.stockRequsition_serial = context
                      .read<Hivecontroller>()
                      .finalProdcutStockreqSerial
                      .text
                      .to_int();
                  context.read<Hivecontroller>().updateRecord(t);
                  context.read<Hivecontroller>().clearfields();
                  context.read<Hivecontroller>().temprecord = null;

                  context.read<Hivecontroller>().Refrech_UI();
                }
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'حفظ',
                style: TextStyle(fontSize: 18),
              ),
            )),
        const Gap(9),
        // ElevatedButton(
        //     style: const ButtonStyle(
        //         backgroundColor:
        //             WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
        //     onPressed: () async {

        //       // await Printing.layoutPdf(
        //       //     onLayout: (_) =>generatePdf( ));
        //     },
        //     child: const Padding(
        //       padding: EdgeInsets.all(6.0),
        //       child: Text(
        //         'طباعة الوزنة فقط',
        //         style: TextStyle(fontSize: 18),
        //       ),
        //     )),
        const Gap(9),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 203, 218, 7))),
            onPressed: () {
              // var t = context.read<Hivecontroller>().temprecord;
              // if (t != null) {
              //   context
              //       .read<Hivecontroller>()
              //       .getInvoiceByNumber(t.stockRequsition_serial)
              //       .then((onValue) => PDF2
              //           .generate(context, Invoice.fromJson(onValue.toString()))
              //           .then((e) => showDialog(
              //               context: context,
              //               builder: (h) => AlertDialog(
              //                     content: SizedBox(
              //                       width:
              //                           MediaQuery.of(context).size.width * .7,
              //                       child: PDfpreview(
              //                         v: e.save(),
              //                       ),
              //                     ),
              //                   ))));
              // }
            },
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'طباعة الوزنة والحمولة',
                style: TextStyle(fontSize: 18),
              ),
            )),
        const Gap(9),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 218, 7, 7))),
            onPressed: () {
              var t = context.read<Hivecontroller>().temprecord;
              if (t != null) {
                t.actions.add(WhigtTecketAction.archive_tecket.add);
                context.read<Hivecontroller>().updateRecord(t);
                context.read<Hivecontroller>().clearfields();
                context.read<Hivecontroller>().temprecord = null;
                context.read<Hivecontroller>().Refrech_UI();
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'حذف',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ].reversed.toList(),
    );
  }
}

class PDfpreview extends StatelessWidget {
  const PDfpreview({super.key, required this.v});
  final FutureOr<Uint8List> v;
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        body: PdfPreview(build: (d) => v),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: PdfPreview(build: (d) => v),
      );
    }
  }
}
