import 'dart:async';
import '../Widgets/recordingWidget.dart';
import 'package:flutter/material.dart';
import 'package:medcorder_audio/medcorder_audio.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioPlayer1 extends StatefulWidget {
  Function(String result) AudioRecordedCallback;

  AudioPlayer1({
    @required this.AudioRecordedCallback,
  });

  @override
  _AudioPlayer1 createState() => new _AudioPlayer1();
}

class _AudioPlayer1 extends State<AudioPlayer1> {
  MedcorderAudio audioModule = new MedcorderAudio();
  bool canRecord = false;
  double recordPower = 0.0;
  double recordPosition = 0.0;
  bool isRecord = false;
  bool isPlay = false;
  double playPosition = 0.0;
  String file = mainPath;
  static String urlPath;


  @override
  initState() {
    super.initState();
    audioModule.setCallBack((dynamic data) {
      _onEvent(data);
    });
    _initSettings();
  }

  Future _initSettings() async {
    final String result = await audioModule.checkMicrophonePermissions();

    if (await Permission.microphone.request().isGranted){
      await audioModule.setAudioSettings();
      setState(() {
        canRecord = true;
      });
    }

    // if (result == 'OK') {
    //   await audioModule.setAudioSettings();
    //   setState(() {
    //     canRecord = true;
    //   });
    // }
    return;
  }

  Future _startRecord() async {
    try {
      DateTime time = new DateTime.now();
      setState(() {
        file = time.millisecondsSinceEpoch.toString();
      });
      final String result = await audioModule.startRecord(file);
      setState(() {
        isRecord = true;
      });
      print('startRecord: ' + result);
    } catch (e) {
      file = "";
      print('startRecord: fail');
    }
  }

  Future _stopRecord() async {
    try {
      final String result = await audioModule.stopRecord();
      print('stopRecord: ' + result);
      if (widget.AudioRecordedCallback != null) {
        widget.AudioRecordedCallback(urlPath);
      }
      setState(() {
        isRecord = false;
      });
    } catch (e) {
      print('stopRecord: fail');
      setState(() {
        isRecord = false;
      });
    }
  }

  Future _startStopPlay() async {
    if (isPlay) {
      await audioModule.stopPlay();
    } else {
      await audioModule.startPlay({
        "file": file,
        "position": 0.0,
      });
    }
  }

  void _onEvent(dynamic event) {
    if (event['code'] == 'recording') {
      double power = event['peakPowerForChannel'];
      setState(() {
        recordPower = (60.0 - power.abs().floor()).abs();
        recordPosition = event['currentTime'];
      });
    }
    if (event['code'] == 'playing') {
      String url = event['url'];
      setState(() {
        playPosition = event['currentTime'];
        isPlay = true;
      });
    }
    if (event['code'] == 'audioPlayerDidFinishPlaying') {
      setState(() {
        playPosition = 0.0;
        isPlay = false;
      });
    }
    urlPath = event['url'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
          child: canRecord
              ? Row(
                  children: <Widget>[
                    new InkWell(
                      child: Container(
                        child: Icon(isRecord ? Icons.stop : Icons.mic),
                      ),
                      onTap: () {
                        if (isRecord) {
                          _stopRecord();
                        } else {
                          _startRecord();
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    new InkWell(
                      child: new Container(
                        child: Icon(isPlay ? Icons.pause : Icons.play_arrow),
                      ),
                      onTap: () {
                        if (!isRecord && file.length > 0) {
                          _startStopPlay();
                        }
                      },
                    ),
                  ],
                )
              : FlatButton(
            onPressed: (){
              _initSettings();
            },
                child: new Text(
                    'میکروفون غیرفعال است',
                    textAlign: TextAlign.center,
                  ),
              )),
    );
  }
}

// import 'dart:async';
//
// import 'package:audio_recorder/audio_recorder.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:medcorder_audio/medcorder_audio.dart';
// import 'package:register/Widgets/recordingWidget.dart';
//
// class AudioPlayer1 extends StatefulWidget {
//   Function(String result) AudioRecordedCallback;
//
//   AudioPlayer1({
//     @required this.AudioRecordedCallback,
//   });
//
//   @override
//   _AudioPlayer1 createState() => new _AudioPlayer1();
// }
//
// class _AudioPlayer1 extends State<AudioPlayer1> {
//   MedcorderAudio audioModule = new MedcorderAudio();
//   bool canRecord = false;
//   double recordPower = 0.0;
//   double recordPosition = 0.0;
//   bool isRecord = false;
//   bool isPlay = false;
//   double playPosition = 0.0;
//   String file = mainPath;
//   Recording recording;
//   AudioPlayer audioPlayer = AudioPlayer();
//   bool playing = false;
//
//   @override
//   initState() {
//     super.initState();
//     audioModule.setCallBack((dynamic data) {
//       _onEvent(data);
//     });
//     _initSettings();
//   }
//
//   Future _initSettings() async {
//     final String result = await audioModule.checkMicrophonePermissions();
//     if (result == 'OK') {
//       await audioModule.setAudioSettings();
//       setState(() {
//         canRecord = true;
//       });
//     }
//     return;
//   }
//
//   Future _startRecord() async {
//     try {
//       DateTime time = new DateTime.now();
//       setState(() {
//         file = time.millisecondsSinceEpoch.toString();
//       });
//       final String result = await audioModule.startRecord(file);
//       setState(() {
//         isRecord = true;
//       });
//       print('startRecord: ' + result);
//     } catch (e) {
//       file = "";
//       print('startRecord: fail');
//     }
//   }
//
//   Future _stopRecord() async {
//     try {
//       final String result = await audioModule.stopRecord();
//       print('stopRecord: ' + result);
//       setState(() {
//         isRecord = false;
//       });
//     } catch (e) {
//       print('stopRecord: fail');
//       setState(() {
//         isRecord = false;
//       });
//     }
//   }
//
//   Future _startStopPlay() async {
//     bool isRecording = await AudioRecorder.isRecording;
//
//     if (recording != null && !isRecording) {
//       if (!playing) {
//         int result = await audioPlayer.play(recording.path, isLocal: true);
//         playing = true;
//       } else {
//         int result = await audioPlayer.stop();
//         playing = false;
//       }
//     }
//     // if (isPlay) {
//     //   await audioModule.stopPlay();
//     // } else {
//     //   await audioModule.startPlay({
//     //     "file": file,
//     //     "position": 0.0,
//     //   });
//     // }
//   }
//
//   void _onEvent(dynamic event) {
//     if (event['code'] == 'recording') {
//       double power = event['peakPowerForChannel'];
//       setState(() {
//         recordPower = (60.0 - power.abs().floor()).abs();
//         recordPosition = event['currentTime'];
//       });
//     }
//     if (event['code'] == 'playing') {
//       String url = event['url'];
//       setState(() {
//         playPosition = event['currentTime'];
//         isPlay = true;
//       });
//     }
//     if (event['code'] == 'audioPlayerDidFinishPlaying') {
//       setState(() {
//         playPosition = 0.0;
//         isPlay = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.all(10.0),
//       padding: EdgeInsets.all(5.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//       child: Center(
//           child: canRecord
//               ? Row(
//                   children: <Widget>[
//                     new InkWell(
//                       child: Container(
//                         padding: EdgeInsets.all(10.0),
//                         child: Icon(isRecord ? Icons.stop : Icons.mic),
//                       ),
//                       onTap: () async {
//                         try {
//                           bool hasPermissions =
//                               await AudioRecorder.hasPermissions;
//                           //isRecord = await AudioRecorder.isRecording;
//
//                           if (isRecord) {
//                             recording = await AudioRecorder.stop();
//                             isRecord = false;
//                             //_stopRecord();
//                             if (widget.AudioRecordedCallback != null) {
//                               widget.AudioRecordedCallback(recording.path);
//                             }
//                           } else {
//                             await AudioRecorder.start(
//                                 path: DateTime.now()
//                                         .millisecondsSinceEpoch
//                                         .toString() +
//                                     ".wav",
//                                 audioOutputFormat: AudioOutputFormat.WAV);
//                             isRecord = true;
// //                          _startRecord();
//                           }
//                         } catch (eeee) {
//                           print(eeee);
//                         }
//                       },
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     new InkWell(
//                       child: new Container(
//                         padding: EdgeInsets.all(10.0),
//                         child: Icon(isRecord ? Icons.pause : Icons.play_arrow),
//                       ),
//                       onTap: () {
//                         if (!isRecord && file.length > 0) {
//                           _startStopPlay();
//                         }
//                       },
//                     ),
//                   ],
//                 )
//               : new Text(
//                   'عدم دسترسی به میکروفون',
//                   textAlign: TextAlign.center,
//                 )),
//     );
//   }
// }
