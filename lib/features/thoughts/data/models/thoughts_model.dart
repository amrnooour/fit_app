class ThoughtsModel {
  final bool value;
  final Data data;
  final int code;

  ThoughtsModel({
    required this.value,
    required this.data,
    required this.code,
  });

  factory ThoughtsModel.fromJson(Map<String, dynamic> json) {
    return ThoughtsModel(
      value: json['value'],
      data: Data.fromJson(json['data']),
      code: json['code'],
    );
  }
}

class Data {
  final List<Item> items;
  final Paginate paginate;

  Data({
    required this.items,
    required this.paginate,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var itemsFromJson = json['items'] as List;
    List<Item> itemsList = itemsFromJson.map((i) => Item.fromJson(i)).toList();

    return Data(
      items: itemsList,
      paginate: Paginate.fromJson(json['paginate']),
    );
  }
}

class Paginate {
  final int total;
  final int count;
  final int perPage;
  final String nextPageUrl;
  final String prevPageUrl;
  final int currentPage;
  final int totalPages;

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
      nextPageUrl: json['next_page_url'] ?? '',
      prevPageUrl: json['prev_page_url'] ?? '',
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
    );
  }
}

class Item {
  final int id;
  final User user;
  final String title;
  final String? subtitle;
  final String content;
  final int likesCount;
  final int likesCountAbbreviate;
  final int commentsCount;
  final bool isLiked;
  final String? reaction;
  final String type;
  final Media media;
  final List<Media> challengeMedia;
  final String date;
  final String time;
  final String utc;
  final bool ready;
  final String clientTag;
  final String clientTagColor;

  Item({
    required this.id,
    required this.user,
    required this.title,
    this.subtitle,
    required this.content,
    required this.likesCount,
    required this.likesCountAbbreviate,
    required this.commentsCount,
    required this.isLiked,
    this.reaction,
    required this.type,
    required this.media,
    required this.challengeMedia,
    required this.date,
    required this.time,
    required this.utc,
    required this.ready,
    required this.clientTag,
    required this.clientTagColor,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    var challengeMediaFromJson = json['challenge_media'] as List;
    List<Media> challengeMediaList = challengeMediaFromJson.map((i) => Media.fromJson(i)).toList();

    return Item(
      id: json['id'],
      user: User.fromJson(json['user']),
      title: json['title'],
      subtitle: json['subtitle'],
      content: json['content'],
      likesCount: json['likes_count'],
      likesCountAbbreviate: json['likes_count_abbreviate'],
      commentsCount: json['comments_count'],
      isLiked: json['is_liked'],
      reaction: json['reaction'],
      type: json['type'],
      media: Media.fromJson(json['media']),
      challengeMedia: challengeMediaList,
      date: json['date'],
      time: json['time'],
      utc: json['utc'],
      ready: json['ready'],
      clientTag: json['client_tag'],
      clientTagColor: json['client_tag_color'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class Media {
  final String thumbnail;
  final String url;
  final String length;
  final String seconds;

  Media({
    required this.thumbnail,
    required this.url,
    required this.length,
    required this.seconds,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      thumbnail: json['thumbnail'],
      url: json['url'] ?? '',
      length: json['length'],
      seconds: json['seconds'],
    );
  }
}