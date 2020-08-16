import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as html;

Future<List<String>> getNumber(http.Client client, int round) async {
  final response = await client
      .get('https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo=+$round');
  html.Document document = parser.parse(response.body);
  var winNum = document.getElementsByClassName('num win');
  var bonusNum = document.getElementsByClassName('num bonus');
  List<String> allNumber = [];
  String bNum = bonusNum[0].children[1].text;
  for (int i = 0; i < 5; i++) {
    allNumber.add(winNum[0].children[1].children[i].text);
  }
  allNumber.add(bNum);
  print(allNumber);
  return allNumber;
}
