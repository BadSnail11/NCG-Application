// import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:async';

import 'package:night_call/models/courier.dart';

import 'utils/server.dart' as serv;


void strapi(){
  var server = serv.ApiService();
  // final list = n.getCouriers();
  // final one = server.getSingleCourier(3);
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
  // var info = newCourierInfo("Саня", "Тестовый", "Кура", "+123121231");
  // final newCourier = server.createCourier("Саня", "Тестовый", "Кура", "+123121231");
  final newCourier = server.getCouriers();
  newCourier.then((data) {
    for (Courier coureir in data!){
      log(coureir.first_name);
    }
  });
}