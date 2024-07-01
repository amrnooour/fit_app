class ArticlesModel {
  bool value;
  MyData data;
  int code;

  ArticlesModel({required this.value, required this.data, required this.code});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      value: json['value'],
      data: MyData.fromJson(json['data']),
      code: json['code'],
    );
  }
}

class MyData {
  List<MyItem> items;
  MyPaginate paginate;

  MyData({required this.items, required this.paginate});

  factory MyData.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<MyItem> items =
        itemsList.map((itemJson) => MyItem.fromJson(itemJson)).toList();

    return MyData(
      items: items,
      paginate: MyPaginate.fromJson(json['paginate']),
    );
  }
}

class MyItem {
  int id;
  String title;
  String content;
  String image;
  String date;

  MyItem({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.date,
  });

  factory MyItem.fromJson(Map<String, dynamic> json) {
    return MyItem(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      date: json['date'],
    );
  }
}

class MyPaginate {
  int total;
  int count;
  int perPage;
  String nextPageUrl;
  String prevPageUrl;
  int currentPage;
  int totalPages;

  MyPaginate({
    required this.total,
    required this.count,
    required this.perPage,
    required this.nextPageUrl,
    required this.prevPageUrl,
    required this.currentPage,
    required this.totalPages,
  });

  factory MyPaginate.fromJson(Map<String, dynamic> json) {
    return MyPaginate(
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
    );
  }
}