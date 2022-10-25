import 'dart:async';
import 'dart:convert';
import 'package:untitled/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Result>?> getPosts() async {

    List<Result> list;

    var client  = http.Client();

    var uri = Uri.parse('http://admin.sports.com.kg/api/sports_areas');

    var responses = await client.get(uri);

    if (responses.statusCode == 200) {

      final parsed = json.decode(responses.body) as Map<String, dynamic>;
      list = parsed['results'].map<Result>((e) =>Result.fromJson(e)).toList();
      print(parsed['results']);
      // final p = Post.fromJson(parsed);
      // list.add(p);
      return list;
    }
  }
}