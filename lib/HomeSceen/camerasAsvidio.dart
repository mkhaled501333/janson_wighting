// import 'package:flutter/material.dart';
// // import 'package:media_kit/media_kit.dart';
// // import 'package:media_kit_video/media_kit_video.dart';

// class CamerasAsVidio extends StatelessWidget {
//   CamerasAsVidio({
//     super.key,
//   });
//   // final player1 = Player();
//   // final player2 = Player();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FutureBuilder(
//           future: player1.open(Media(
//               'rtsp://admin:Admin@123@192.168.1.90:554/Streaming/Channels/102')),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             return Video(
//                 height: 230,
//                 width: MediaQuery.of(context).size.width * .22,
//                 fit: BoxFit.fill,
//                 onEnterFullscreen: () {
//                   return player1.open(Media(
//                       'rtsp://admin:Admin@123@192.168.1.90:554/Streaming/Channels/101'));
//                 },
//                 onExitFullscreen: () {
//                   return player1.open(Media(
//                       'rtsp://admin:Admin@123@192.168.1.90:554/Streaming/Channels/102'));
//                 },
//                 controller: VideoController(
//                   player1,
//                 ));
//           },
//         ),
//         FutureBuilder(
//           future: player2.open(Media(
//               'rtsp://admin:Admin@123@192.168.1.90:554/Streaming/Channels/202')),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             return Video(
//                 height: 230,
//                 width: MediaQuery.of(context).size.width * .22,
//                 fit: BoxFit.fill,
//                 onEnterFullscreen: () {
//                   return player2.open(Media(
//                       'rtsp://admin:Admin@123@192.168.1.90:554/Streaming/Channels/201'));
//                 },
//                 onExitFullscreen: () {
//                   return player2.open(Media(
//                       'rtsp://admin:Admin@123@192.168.1.90:554/Streaming/Channels/202'));
//                 },
//                 controller: VideoController(
//                   player2,
//                 ));
//           },
//         ),
//       ],
//     );
//   }
// }
