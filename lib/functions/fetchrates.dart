import 'package:currencyconverter/models/ratesmodel.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchrates() async {
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=7d382a11708a47beb3e9e0c64d6d56dc'));
  print(response.body);
  final result = ratesModelFromJson(response.body);


  return result;
}