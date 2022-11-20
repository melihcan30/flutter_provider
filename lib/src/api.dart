import 'package:dio/dio.dart';

import 'category.dart';
import 'search_options.dart';

const zLocations = ['city', 'subzone', 'zone', 'landmark', 'metro', 'group'];
const zSort = ['cost', 'rating'];
const zOrder = ['asc', 'desc'];
const double zMaxCount = 20;

class ZomatoApi {
  final List<String> locations = zLocations;
  final List<String> sort = zSort;
  final List<String> order = zOrder;
  final double count = zMaxCount;

  final Dio _dio;
  final List<Category> categories = [];

  ZomatoApi(String key)
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://zomatoapi-bhaskar.p.rapidapi.com',
          headers: {
            "X-RapidAPI-Key":
                "17695cba14msh9439077c8485297p18cbd9jsn09c76ba55b73",
            "X-RapidAPI-Host": "zomatoapi-bhaskar.p.rapidapi.com",
          },
        ));

  Future loadCategories() async {
    final response = await _dio.get('categories');
    final data = response.data['categories'];
    categories.addAll(data.map<Category>((json) => Category(
          json['categories']['id'],
          json['categories']['name'],
        )));
  }

  Future<List> searchRestaurants(String query, SearchOptions options) async {
    final response = await _dio.get('search', queryParameters: {
      'q': query,
      // ignore: unnecessary_null_comparison
      ...(options != null ? options.toJson() : {}),
    });
    return response.data['restaurants'];
  }
}
