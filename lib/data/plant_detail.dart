import 'dart:convert';

Map<String, Plantdetail> plantdetailFromJson(String str) =>
    Map.from(json.decode(str)).map(
        (k, v) => MapEntry<String, Plantdetail>(k, Plantdetail.fromJson(v)));

String plantdetailToJson(Map<String, Plantdetail> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Plantdetail {
  String dec;
  String image;
  String price;
  String title;

  Plantdetail({
    required this.dec,
    required this.image,
    required this.price,
    required this.title,
  });

  factory Plantdetail.fromJson(Map<String, dynamic> json) => Plantdetail(
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
