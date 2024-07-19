import 'dart:convert';

Map<String, String> allCurrenciesFromJson(String str) => Map.from(json.decode(str)).map((k,v) => MapEntry<String, String>(k,v));

String allCurrenciesToJson(Map<String, String> data) => json.encode(Map.from(data).map((k,v) => MapEntry<String, dynamic>(k,v)));
// we extract data from all currency to a string and convert it into a json