import 'package:flutter_sanyukt/model/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<http.Response> generateOtp(String mobile) async {
    print("Calling generate Otp");
    var response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.generateOTP),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_mobile': mobile,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
