// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janson_wighting/HomeSceen/Home.dart';
import 'package:janson_wighting/data/networking.dart';
import 'package:janson_wighting/data/providers.dart';
// import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // MediaKit.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ImcomingValueporvider()
          ..port
          ..initport()
          ..stream(),
      ),
      ChangeNotifierProvider(create: (context) => Hivecontroller()..initHive()),
      ChangeNotifierProvider(
        create: (context) => ServerDB(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ServerDB>().SendPending_GetAll_ConnectAndListenchannels();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          actions: const [],
          title: Row(
            children: [
              StreamBuilder(
                  stream: isServerOnline(),
                  builder: (c, a) {
                    return Row(
                      children: [
                        const Text(
                          "server stutues :",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const Gap(5),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: isserveronline
                                ? const Color.fromARGB(255, 111, 255, 116)
                                : Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          isserveronline ? 'online' : "offline",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                      ],
                    );
                  }),
              Gap(MediaQuery.of(context).size.width * .3),
              const Center(
                  child: Text(
                "يانسن فوم",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              context.read<ImcomingValueporvider>().port.isOpen == true
                  ? const SizedBox()
                  : Container(
                      color: Colors.black,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "الميزان غير متصل ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 9, 116, 238),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 102, 206),
        body: Home(),
      ),
    );
  }
}
