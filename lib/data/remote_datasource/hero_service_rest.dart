
//baseUrl: "/characters?limit=20&offset=0&ts=1695763389401&apikey=025f2cd3ea0aaa7b9c445d8a5897de59&hash=0b781b3ed9c65963515be210bbc4a583"
// http://gateway.marvel.com/v1/public/characters?limit=20&offset=0&ts=1695763389401&apikey=025f2cd3ea0aaa7b9c445d8a5897de59&hash=0b781b3ed9c65963515be210bbc4a583

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'entity/dto.dart';

abstract class HeroService {
  Future<StatusResponse> fetchHeroes({int length = 0});
}

class HeroServiceImpl extends HeroService {

  @override
  Future<StatusResponse> fetchHeroes({int length = 0}) async {
    final url = 'http://gateway.marvel.com/v1/public/characters?limit=20&offset=$length&ts=1695763389401&apikey=025f2cd3ea0aaa7b9c445d8a5897de59&hash=0b781b3ed9c65963515be210bbc4a583';
    print('URL: $url');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
        return Future.value(
          StatusResponse.from(jsonDecode(response.body))
        );
    }
    throw UnimplementedError();
  }


  static HeroService create() {
      return HeroServiceImpl();
  }

}
