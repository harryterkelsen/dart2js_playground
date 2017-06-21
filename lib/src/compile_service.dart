import 'dart:async';
import 'dart:convert';

import 'package:angular2/angular2.dart';
import 'package:http/browser_client.dart';

const url = 'https://dart-services.appspot.com/api/dartservices/v1/compile';
const userCodeStartMarker = 'main.dart';
const userCodeEndMarker = '}, 1]];';
const preambleComment =
    '// Code shared by all dart2js compilations omitted.\n\n';

@Injectable()
class CompileService {
  final _client = new BrowserClient();

  Future<String> compile(String code) async {
    var response = await _client.post(url, body: JSON.encode({'source': code}));
    var result = JSON.decode(response.body);
    if (result['result'] == null) return null;
    return preambleComment + _getUserCode(result['result']);
  }

  String _getUserCode(String code) {
    return LineSplitter
        .split(code)
        .skipWhile((line) => !line.contains(userCodeStartMarker))
        // skip 2 boilerplate lines
        .skip(2)
        .takeWhile((line) => line.trim() != userCodeEndMarker)
        .map((line) => _deindent(line, 4))
        .join('\n');
  }

  String _deindent(String line, int spaces) {
    assert(line.startsWith(' ' * spaces));
    return line.substring(spaces);
  }
}
