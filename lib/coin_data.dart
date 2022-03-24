import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const endUrl =
    'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=1747A80F-30BB-4470-B645-219C8E2CF3AC';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '1747A80F-30BB-4470-B645-219C8E2CF3AC';

class CoinData {
  Future getCoinData({String selectedCurrency}) async {
    Map cryptoMap = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse((requestURL)));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        cryptoMap[crypto] = lastPrice;
        print(lastPrice);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    print(cryptoMap);
    return cryptoMap;
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    //TODO 5: Return a Map of the results instead of a single value.
  }
}
