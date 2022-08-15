import 'dart:convert';

import 'package:debitapp_bloc/data/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataRepo {
  List<Datum> dataList = [];
  final apiUrl = 'https://communiqo.com/test_api/flutterTest.php?pageNo=0';
  Future<List<Datum>> getData() async {
    final res = await http.get(Uri.parse(apiUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['data'];

      dataList = body.map((dynamic item) => Datum.fromJson(item)).toList();

      return dataList;
    } else {
      throw ("cannot get data");
    }
  }
}
