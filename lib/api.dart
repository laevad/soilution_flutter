import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soilution_flutter/constant.dart';

class Api {
  Future getSoil(String filepath) async {
    var url = Constant().url;
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('file', filepath));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      final result = await jsonDecode(response.body) as Map<String, dynamic>;
      // print("=--------------------------------------------------");
      print(result);
      // print(response.statusCode) ;
      // print(filepath);
      if (response.statusCode == 201) {
        return result;
      } else {
        return "N/A";
      }
    } catch (e) {
      return "N/A";
    }
  }
}
