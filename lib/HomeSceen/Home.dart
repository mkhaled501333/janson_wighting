import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/HomeSceen/camerasAsImages.dart';
import 'package:janson_wighting/HomeSceen/wightData.dart';
import 'package:janson_wighting/data/providers.dart';
import 'package:janson_wighting/widgets/%D8%A7%D9%84%D8%A7%D9%88%D9%84%D9%89%20%D9%88%D8%A7%D9%84%D8%AB%D8%A7%D9%86%D9%8A%D9%87.dart';
import 'package:janson_wighting/widgets/buttoms.dart';
import 'package:janson_wighting/widgets/pdf.dart';
import 'package:janson_wighting/widgets/report/reports.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import '../widgets/بيانات الوزن و التزكره.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //black item
          const WhightInput(),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (c) => const biscolView()));
              },
              child: const Text('تقارير')),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Column(
                children: [
                  CamerasAsImages(),
                ],
              ),
              const NotCompletedTecket(),
              const Gap(9),
              const weightInfo(),
              const Gap(9),
              wightTecket(),
              const Gap(9)
            ],
          ),
          const Gap(9),
          const buttoms(),

          Column(
            children: [
              Consumer<Hivecontroller>(
                builder: (context, myType, child) {
                  if (myType.temprecord != null) {
                    return SizedBox(
                      height: 300,
                      width: 500,
                      child: PdfPreview(
                        build: (format) =>
                            generatePdf(context, myType.temprecord!),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const Text(
                "عند الوزن الاول",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord != null &&
                          myType.temprecord!.firstShotpiccam1.isNotEmpty) {
                        return InteractiveViewer(
                          child: Column(
                            children: [
                              Visibility(
                                visible: myType.temprecord!.synced == false,
                                child: Image.memory(
                                  Uint8List.fromList(
                                      myType.temprecord!.firstShotpiccam1),
                                  width: 500,
                                  height: 400,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Visibility(
                                visible: myType.temprecord!.synced == true &&
                                    myType.temprecord!.firstShotpiccam1Adress
                                        .isNotEmpty,
                                child: Visibility(
                                  visible: myType.temprecord!.synced == true,
                                  child: Image.network(
                                    'http://192.168.1.225:8080/i?imageid=${myType.temprecord!.firstShotpiccam1Adress}',
                                    width: 400,
                                    height: 400,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord != null &&
                          myType.temprecord!.firstShotpiccam2.isNotEmpty) {
                        return Column(
                          children: [
                            Visibility(
                              visible: myType.temprecord!.synced == false,
                              child: Image.memory(
                                Uint8List.fromList(
                                    myType.temprecord!.firstShotpiccam2),
                                width: 500,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Visibility(
                              visible: myType.temprecord!.synced == true &&
                                  myType.temprecord!.firstShotpiccam2Adress
                                      .isNotEmpty,
                              child: Visibility(
                                visible: myType.temprecord!.synced == true,
                                child: Image.network(
                                  'http://192.168.1.225:8080/i?imageid=${myType.temprecord!.firstShotpiccam2Adress}',
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
              const Text(
                "عند الوزن الثانى",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord != null &&
                          myType.temprecord!.secondShotpiccam1.isNotEmpty) {
                        return Column(
                          children: [
                            Visibility(
                              visible: myType.temprecord!.synced == false,
                              child: Image.memory(
                                Uint8List.fromList(
                                    myType.temprecord!.secondShotpiccam1),
                                width: 500,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Visibility(
                              visible: myType.temprecord!.synced == true &&
                                  myType.temprecord!.secondShotpiccam1Adress
                                      .isNotEmpty,
                              child: Image.network(
                                'http://192.168.1.225:8080/i?imageid=${myType.temprecord!.secondShotpiccam1Adress}',
                                width: 400,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  Consumer<Hivecontroller>(
                    builder: (context, myType, child) {
                      if (myType.temprecord != null &&
                          myType.temprecord!.secondShotpiccam2.isNotEmpty) {
                        return Column(
                          children: [
                            Visibility(
                              visible: myType.temprecord!.synced == false,
                              child: Image.memory(
                                Uint8List.fromList(
                                    myType.temprecord!.secondShotpiccam2),
                                width: 500,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Visibility(
                              visible: myType.temprecord!.synced == true &&
                                  myType.temprecord!.secondShotpiccam2Adress
                                      .isNotEmpty,
                              child: Image.network(
                                'http://192.168.1.225:8080/i?imageid=${myType.temprecord!.secondShotpiccam2Adress}',
                                width: 400,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
