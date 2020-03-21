import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Storage {
  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<String> readGoal() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<File> writeGoal(String goal) async {
    final file = await _localFile;
    return file.writeAsString(goal);
  }

  Future<File> flushDocument() async {
    final file = await _localFile;
    return file.writeAsString("", mode: FileMode.write, flush: true);
  }
}
