class ArticlesModel {
  bool value;
  Data data;
  int code;

  ArticlesModel({
    required this.value,
    required this.data,
    required this.code,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      value: json['value'],
      data: Data.fromJson(json['data']),
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'data': data.toJson(),
      'code': code,
    };
  }
}

// The Data class containing items and pagination info
class Data {
  List<Item> items;
  Paginate paginate;

  Data({
    required this.items,
    required this.paginate,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<Item> items = itemsList.map((i) => Item.fromJson(i)).toList();

    return Data(
      items: items,
      paginate: Paginate.fromJson(json['paginate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((i) => i.toJson()).toList(),
      'paginate': paginate.toJson(),
    };
  }
}

// The Item class representing each item
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_name': clientName,
      'subtitle': subtitle,
      'content': content,
      'image': image,
      'date': date,
    };
  }
}

// The Paginate class representing pagination information
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

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'count': count,
      'per_page': perPage,
      'next_page_url': nextPageUrl,
      'prev_page_url': prevPageUrl,
      'current_page': currentPage,
      'total_pages': totalPages,
    };
  }
}