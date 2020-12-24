import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class Storage{
  static Future<String> getDirectioryPath() async{
    final Directory extdir=await getApplicationDocumentsDirectory(

    );
    final String dirPath="${extdir.path}/pictures/selfie";
    await Directory(dirPath).create(recursive: true);
    return dirPath;
  }
  static Future<String> getFieldPath()async{
    String timestamp()=>DateTime.now().millisecondsSinceEpoch.toString();
    final String dirpath=await getDirectioryPath();
    return '$dirpath/${timestamp()}.jpg';

  }
  static Future <List<String>> getFilePaths() async{
    final List<String> paths=[];
    var directory=Directory(await getDirectioryPath());
    var completer=Completer<List<String>>();
    var lister=directory.list(recursive: false);
    lister.listen((file){
      if(file is File)paths.insert(0, file.path);
    },
        onDone:()=>completer.complete(paths));
    return completer.future;

  }
}

