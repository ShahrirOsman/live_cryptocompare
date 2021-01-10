import 'networking.dart';

const List<String> currenciesList = [
  'MYR',
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

const coinAPIURL = 'https://min-api.cryptocompare.com/data/pricemulti';
const apiKey =
    '44035ed8453ff6c0d605a38d0b58c36ef099861662b7887c365ad82a751d3e84';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String cryptoJoinList = cryptoList.join(',');
    Map<String, String> cryptoPrices = {};

    NetworkHelper networkHelper = NetworkHelper(
        '$coinAPIURL?fsyms=$cryptoJoinList&tsyms=$selectedCurrency&api_key=$apiKey');

    var coinData = await networkHelper.getData();

    for (String crypto in cryptoList) {
      String price = coinData['$crypto']['$selectedCurrency'].toString();
      cryptoPrices[crypto] = price;
    }

    return cryptoPrices;
  }
}
