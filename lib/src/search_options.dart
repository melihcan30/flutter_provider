class SearchOptions {
  String location;
  String order;
  String sort;
  double count;
  List<int> categories = [];

  SearchOptions({
    required this.location,
    required this.order,
    required this.sort,
    required this.count,
  });

  Map<String, dynamic> toJson() => {
        'entity_type': location,
        'sort': sort,
        'order': order,
        'count': count,
        'category': categories.join(',')
      };
}
