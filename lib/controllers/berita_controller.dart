import 'dart:convert';

import 'package:http/http.dart' as http;

class BeritaController {
  Future getBerita() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=e797ef762b134cac8e73fc508f0c4791";
    final res = await http.get(
      Uri.parse(url),
    );
    return jsonDecode(res.body);
  }
}
