import 'package:flutter/material.dart';
import 'package:janson_wighting/utils/app.dart';
import 'package:janson_wighting/data/providers.dart';
import 'package:provider/provider.dart';

class WhightInput extends StatelessWidget {
  const WhightInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //wight value
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Selector<ImcomingValueporvider, String>(
              selector: (_, myType) => myType.nowValu,
              builder: (context, v, child) {
                return Text(v,
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ));
              },
            ),
          ),
          //date
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Text(
                  DateTime.now().formatt_yMd(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 231, 216, 216),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                StreamBuilder(
                  stream: Stream<int>.periodic(
                      const Duration(seconds: 1), (count) => count),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Text(
                      DateTime.now().formatt_hms(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 88, 185, 7),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    );
                  },
                ),
              ],
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
