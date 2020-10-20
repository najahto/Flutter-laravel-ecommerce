import 'package:http/http.dart' as http;

class Repository{

   final String _baseUrl = 'http://10.0.2.2:8000/api';

  httpGet(String api ) async{
    return await http.get(_baseUrl + "/" + api);
  }
}