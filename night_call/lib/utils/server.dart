import 'dart:convert';
import 'dart:developer';
import 'dart:js_interop';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:night_call/models/courier.dart';

class ApiService {
  final _defaultHeader = {"Authorization": "Bearer ${dotenv.get('accessToken')}",
  "Content-Type": "application/json",
  };
  // final _params = "?"

  Future<List<Courier>?> getCouriers() async {
    try {
      var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('couriersEndpoint'));
      var response = await http.get(url, headers: _defaultHeader);
      if (response.statusCode == 200) {
        // log(response.body);
        List <Courier> _model = couriersFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Courier?> getSingleCourier(int id) async {
    try {
      String unit = "/" + id.toString();
      var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('couriersEndpoint') + unit);
      var response = await http.get(url, headers: _defaultHeader);
      if (response.statusCode == 200) {
        Courier _model = singleCourierFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Courier?> updateCourier(Courier courier) async {
    try {
      String unit = "/" + courier.id.toString();
      var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('couriersEndpoint') + unit);
      var body = courier.toJson();
      var response = await http.put(url, headers: _defaultHeader, body: jsonEncode(body));
      if (response.statusCode == 200) {
        return courier;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Courier?> createCourier(String firsrt_name, String second_name, String third_name, String phone, {String telegram_id = ""}) async {
    try {
      var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('couriersEndpoint'));
      var body = newCourierInfo(firsrt_name, second_name, third_name, phone, telegram_id: telegram_id);
      var response = await http.post(url, headers: _defaultHeader, body: jsonEncode(body));
      if (response.statusCode == 200) {
        Courier _model = singleCourierFromJson(response.body);
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