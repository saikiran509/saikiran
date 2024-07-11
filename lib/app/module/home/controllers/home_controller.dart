import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // Observable for loading state
  var isLoading = true.obs;

  // Observable to store the results
  var results = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

 
  Future<void> fetchData() async {
    var apiUrl = Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/week?language=en-US');

    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMDUyYTI1ODMxYmQwMzc3YWVhNDNmZDIyN2JiZDBhNyIsInN1YiI6IjY1NDhmODBjNmJlYWVhMDBjOWZkNjJhMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-f2UGfMXu_McM__6Ko1R2Z2sUxoa5lIkMuTucu-6Zts',
    };

    try {
      isLoading(true);
      var response = await http.get(apiUrl, headers: headers);
      debugPrint('object');
      debugPrint(response.toString());

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        results.value = jsonMap["results"];
        debugPrint(jsonMap.toString());
        isLoading(false);
      } else {
        isLoading(false);
        debugPrint('Request failed with status: ${response.statusCode}');
        debugPrint('Response data: ${response.body}');
      }
    } catch (e) {
      isLoading(false);
      debugPrint('Error: $e');
    }
  }
}
