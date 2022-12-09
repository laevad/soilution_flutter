import 'dart:convert';
import 'package:http/http.dart' as http;

class Api{
  Future<String> getSoil(Map<String, String> body, String filepath) async {
    const url = 'https://soilutionapi.soilution.repl.co/';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
   try{
     var request = http.MultipartRequest('POST', Uri.parse(url))
       ..fields.addAll(body)
       ..headers.addAll(headers)
       ..files.add(await http.MultipartFile.fromPath('file', filepath));
     var streamedResponse  = await request.send();
     var response = await http.Response.fromStream(streamedResponse);
     final result = jsonDecode(response.body) as Map<String, dynamic>;
     if (response.statusCode == 201) {
       return
         result['result'][0];
     } else {
       return "N/A";
     }
   }catch(e){
     return "N/A";
   }
  }
}