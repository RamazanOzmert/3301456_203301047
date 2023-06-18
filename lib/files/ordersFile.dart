import 'package:marketapp/globalStates/orders.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class FileUtils {
  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/orders.txt');
  }

  static Future<File> saveToFile(Order order) async {
    final file = await getFile;
    String str = order.orderId +
        ' ' +
        order.prdId.toString() +
        ' ' +
        order.total +
        ' ' +
        order.date.toString() +
        ' ' +
        order.orderDetail +
        ' ' +
        order.stance;

    return file.writeAsString(str);
  }

  static Future<String> readFromFile() async {
    try {
      final file = await getFile;
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return "";
    }
  }
}
