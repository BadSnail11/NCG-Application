// import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:async';

import 'package:night_call/models/courier.dart';

import 'utils/server.dart' as serv;


void strapi(){
  var n = serv.ApiService();
  final list = n.getCouriers();
  try{
    list.then((data) {
      for (Courier item in data!){
        log(item.first_name);
      }
    });
  } catch (e) {
    log("error");
  }
  // log(list.asStream().first.toString());
  
}