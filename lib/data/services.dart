import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:plantsatu/data/plant_detail.dart';
import 'package:plantsatu/data/plant_model.dart';

Future<Map<String, Plant>> getPlant() async {
  Response response = await Dio().get(
      'https://restapifirebase-cc393-default-rtdb.firebaseio.com/detailpage.json');

  String data = response.toString();
  print(data);

  return plantFromJson(response.toString());
}

Future<Map<String, Plantdetail>> getPlantdetail(String id) async {
  Response response = await Dio().get(
      'https://restapifirebase-cc393-default-rtdb.firebaseio.com/detailpage.json');

  String data = response.toString();
  print(data);

  return plantdetailFromJson(response.toString());
}
