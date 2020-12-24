import 'dart:async';
import 'dart:io' as io;
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:register/Service/EndPointService.dart';

String mainPath;

class RecorderExample extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  int id;

  RecorderExample({
    localFileSystem,
    this.id,
  }) : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new RecorderExampleState();
}

class RecorderExampleState extends State<RecorderExample> {
  FlutterAudioRecorder _recorder;
  Recording _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (_currentStatus) {
          case RecordingStatus.Initialized:
            {
              _start();
              break;
            }
          case RecordingStatus.Recording:
            {
              _currentStatus != RecordingStatus.Unset ? _stop : null;
              _stop();
              break;
            }
          case RecordingStatus.Paused:
            {
              _resume();
              break;
            }
          case RecordingStatus.Stopped:
            {
              _init();
              break;
            }
          default:
            break;
        }
      },
        child: _buildIcon(_currentStatus),

    );

    print("File path of the record: ${_current?.path}");
    print("1");
  }

  _init() async {
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        String customPath = '/flutter_audio_recorder_';
        io.Directory appDocDirectory;
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
        }
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        _recorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await _recorder.initialized;
        var current = await _recorder.current(channel: 0);
        print(current);
        setState(() {
          _current = current;
          _currentStatus = current.status;
          print(_currentStatus);
        });
      } else {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _start() async {
    try {
      await _recorder.start();
      var recording = await _recorder.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = _current.status;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  _resume() async {
    await _recorder.resume();
    setState(() {});
  }

  _pause() async {
    await _recorder.pause();
    setState(() {});
  }

  _stop() async {
    var result = await _recorder.stop();
    print("Stop recording: ${result.path}");
    mainPath = result.path;
    print("Stop recording: ${result.duration}");
    File file = widget.localFileSystem.file(result.path);

    var uploadResult = await EndPointService().uploadVoice(file, widget.id);

    if (uploadResult != null)
// success
      print("File length: ${await file.length()}");
    setState(() {
      _current = result;
      _currentStatus = _current.status;
    });
  }

  Widget _buildIcon(RecordingStatus status) {
    Icon icon;
    switch (_currentStatus) {
      case RecordingStatus.Initialized:
        {
          icon = Icon(
            Icons.mic,
            color: Colors.black45,
          );
          break;
        }
      case RecordingStatus.Recording:
        {
          icon = Icon(
            Icons.mic_none,
            color: Colors.black45,
          );
          break;
        }
      case RecordingStatus.Paused:
        {
          icon = Icon(
            Icons.pause,
            color: Colors.black45,
          );
          break;
        }
      case RecordingStatus.Stopped:
        {
          icon = Icon(
            Icons.stop,
            color: Colors.black45,
          );
          break;
        }
      default:
        break;
    }
    return icon;
  }
}
