import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solarvox/app/modules/projects_engineering/model/projects_eng_model.dart';

class NetworkService {
  List<ProjectsEngineeringModel> posts = [];

  Future getPosts(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      posts = (data as List).map((json) {
        return ProjectsEngineeringModel.fromJson(json);
      }).toList();
      return posts;
    } else {
      print("Error in URL");
    }
  }
}
