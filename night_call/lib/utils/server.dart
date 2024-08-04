import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:night_call/models/courier.dart';

class ApiService {
  Future<List<Courier>?> getCouriers() async {
    try {
      var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('couriersEndpoint'));
      var response = await http.get(url, headers: {"Authorization": "Bearer ${dotenv.get('accessToken')}"});
      if (response.statusCode == 200) {
        // log(response.body);
        List <Courier> _model = CouriersFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}