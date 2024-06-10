class SuccessStoresModel {
  bool value;
  Data data;
  int code;

  SuccessStoresModel({required this.value, required this.data, required this.code});

  factory SuccessStoresModel.fromJson(Map<String, dynamic> json) {
    return SuccessStoresModel(
      value: json['value'],
      data: Data.fromJson(json['data']),
      code: json['code'],
    );
  }
}

class Data {
  List<Item> items;
  Paginate paginate;

  Data({required this.items, required this.paginate});

  factory Data.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    return Data(
      items: itemsList.map((i) => Item.fromJson(i)).toList(),
      paginate: Paginate.fromJson(json['paginate']),
    );
  }
}

class Item {
  int id;
  String clientName;
  String subtitle;
  String content;
  String image;
  String date;

  Item({
    required this.id,
    required this.clientName,
    required this.subtitle,
    required this.content,
    required this.image,
    required this.date,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      clientName: json['client_name'],
      subtitle: json['subtitle'],
      content: json['content'],
      image: json['image'],
      date: json['date'],
    );
  }
}

class Paginate {
  int total;
  int count;
  int perPage;
  String nextPageUrl;
  String prevPageUrl;
  int currentPage;
  int totalPages;

  Paginate({
    required this.total,
    required this.count,
    required this.perPage,
    required this.nextPageUrl,
    required this.prevPageUrl,
    required this.currentPage,
    required this.totalPages,
  });

  factory Paginate.fromJson(Map<String, dynamic> json) {
    return Paginate(
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