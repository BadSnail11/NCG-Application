import 'dart:convert';
import 'dart:js_interop';

// List<Courier> CourierFromJson(String str) => List<Courier>.from(json.decode(str).map((x) => Courier.fromJson(x)));
// List<Courier> CourierFromJson(String str) => (json.decode(str)["data"] as List<Map<String, dynamic>>).map((x) => Courier.fromJson(x)).toList();
// List <Courier> CourierFromJson(String str) => List<Courier>.from((json.decode(str)["data"] as List<dynamic>).map((x) => Courier.fromJson(x)));

List <Courier> couriersFromJson(String str) {
  var js = json.decode(str)["data"];
  List <Courier> list = [];
  for (var element in js) {
    Map <String, dynamic> data = element;
    list.add(Courier.fromJson(data));
  }
  return list;
}

Courier singleCourierFromJson(String str) {
  var js = json.decode(str)["data"];
  return Courier.fromJson(js);
}


class Courier {
  Courier({
    required this.id,
    required this.first_name,
    required this.second_name,
    required this.third_name,
    required this.phone,
    required this.telegram_id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String first_name;
  String second_name;
  String third_name;
  String phone;
  String telegram_id;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Courier.fromJson(Map<String, dynamic> json) => Courier(
    id: json["id"],
    first_name: json["attributes"]["firsrt_name"],
    second_name: json["attributes"]["second_name"],
    third_name: json["attributes"]["third_name"],
    phone: json["attributes"]["phone"],
    telegram_id: json["attributes"]["telegram_id"],
    status: json["attributes"]["status"],
    createdAt: DateTime.parse(json["attributes"]["createdAt"]),
    updatedAt: DateTime.parse(json["attributes"]["updatedAt"]),
  );

  Object? toJson() {
    Map<String, dynamic> json = {};
    Map<String, dynamic> attributes = {};
    attributes.addAll({
      "firsrt_name": first_name,
      "second_name": second_name,
      "third_name": third_name,
      "phone": phone,
      "telegram_id": telegram_id,
      "status": status,
    });
    json.addAll({
      "data": attributes
    });
    return json;
  }
}