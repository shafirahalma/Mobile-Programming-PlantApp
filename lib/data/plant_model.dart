import 'dart:convert';

Map<String, Plant> plantFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Plant>(k, Plant.fromJson(v)));

String plantToJson(Map<String, Plant> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Plant {
  String dec;
  String image;
  String price;
  String title;

  Plant({
    required this.dec,
    required this.image,
    required this.price,
    required this.title,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        dec: json["dec"],
        image: json["image"],
        price: json["price"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "dec": dec,
        "image": image,
        "price": price,
        "title": title,
      };
}
