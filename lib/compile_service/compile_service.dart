import 'dart:async';
import 'dart:convert';

import 'package:angular2/angular2.dart';
import 'package:http/browser_client.dart';

const url = 'https://dart-services.appspot.com/api/dartservices/v1/compile';
const userCodeMarker = 'resource:/main.dart';

@Injectable()
class CompileService {
  final _client = new BrowserClient();

  Future<String> compile(String code) async {
    var response = await _client.post(url, body: JSON.encode({'source': code}));
    var result = JSON.decode(response.body);
    return _getUserCode(result['result']);
  }

  String _getUserCode(String code) {
    return LineSplitter
        .split(code)
        .skipWhile((line) => !line.contains(userCodeMarker))
        // skip 2 boilerplate lines
        .skip(2)
        .takeWhile((line) => line.trim() != '}, 1]];')
        .join('\n');
  }
}
