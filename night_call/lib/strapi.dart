// import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:async';

import 'package:night_call/models/courier.dart';

import 'utils/server.dart' as serv;


void strapi(){
  var n = serv.ApiService();
  // final list = n.getCouriers();
  final one = n.getSingleCourier(3);
  // late Courier courier;
  // one.then((data) {
  //   courier = data!;
  // });
  // courier.status = "free";
  // final upd = n.updateCourier(courier);
  // upd.then((data) {
  //   log(data!.status);
  // });
  // log(list.asStream().first.toString());
  
}