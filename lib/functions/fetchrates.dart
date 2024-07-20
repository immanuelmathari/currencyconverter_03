import 'package:currencyconverter/models/allCurrencies.dart';
import 'package:currencyconverter/models/ratesmodel.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchrates() async {
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=7d382a11708a47beb3e9e0c64d6d56dc'));
  print(response.body);
  final result = ratesModelFromJson(response.body);


  return result;
}

Future<Map> fetchcurrencies() async {
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=7d382a11708a47beb3e9e0c64d6d56dc'));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

String convertusd(Map exchangesRates, String usd, String currency){
  String output = ((exchangesRates[currency] * double.parse(usd)).toStringAsFixed(2)).toString();
  return output;
}

String convertany(Map exchangeRates, String amount, String currencybase, String currencyfinal ) {
  String output = ((double.parse(amount) / exchangeRates[currencybase]) * exchangeRates[currencyfinal]).toStringAsFixed(2);
  return output;
}