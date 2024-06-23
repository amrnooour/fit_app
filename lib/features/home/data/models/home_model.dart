class HomeModel {
  final bool value;
  final Data data;
  final int code;

  HomeModel({required this.value, required this.data, required this.code});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
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

class Data {
  final String freeSubscriptionPeriod;
  final Referrals referrals;
  final List<Slider> sliders;
  final List<Program> programs;
  final List<dynamic> exams;
  final NewsFeed newsFeeds;
  final List<SuccessStory> successStories;
  final List<Article> articles;

  Data({
    required this.freeSubscriptionPeriod,
    required this.referrals,
    required this.sliders,
    required this.programs,
    required this.exams,
    required this.newsFeeds,
    required this.successStories,
    required this.articles,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      freeSubscriptionPeriod: json['free_subscription_period'],
      referrals: Referrals.fromJson(json['referrals']),
      sliders: List<Slider>.from(json['sliders'].map((item) => Slider.fromJson(item))),
      programs: List<Program>.from(json['programs'].map((item) => Program.fromJson(item))),
      exams: List<dynamic>.from(json['exams']),
      newsFeeds: NewsFeed.fromJson(json['news_feeds']),
      successStories: List<SuccessStory>.from(json['success_stories'].map((item) => SuccessStory.fromJson(item))),
      articles: List<Article>.from(json['articles'].map((item) => Article.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'free_subscription_period': freeSubscriptionPeriod,
      'referrals': referrals.toJson(),
      'sliders': sliders.map((item) => item.toJson()).toList(),
      'programs': programs.map((item) => item.toJson()).toList(),
      'exams': exams,
      'news_feeds': newsFeeds.toJson(),
      'success_stories': successStories.map((item) => item.toJson()).toList(),
      'articles': articles.map((item) => item.toJson()).toList(),
    };
  }
}

class Referrals {
  final int count;
  final int subscribed;

  Referrals({required this.count, required this.subscribed});

  factory Referrals.fromJson(Map<String, dynamic> json) {
    return Referrals(
      count: json['count'],
      subscribed: json['subscribed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'subscribed': subscribed,
    };
  }
}

class Slider {
  final int id;
  final String title;
  final String buttonText;
  final String name;
  final String description;
  final String type;
  final dynamic modelId;
  final dynamic externalLink;
  final Media media;

  Slider({
    required this.id,
    required this.title,
    required this.buttonText,
    required this.name,
    required this.description,
    required this.type,
    this.modelId,
    this.externalLink,
    required this.media,
  });

  factory Slider.fromJson(Map<String, dynamic> json) {
    return Slider(
      id: json['id'],
      title: json['title'],
      buttonText: json['button_text'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
      modelId: json['model_id'],
      externalLink: json['external_link'],
      media: Media.fromJson(json['media']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'button_text': buttonText,
      'name': name,
      'description': description,
      'type': type,
      'model_id': modelId,
      'external_link': externalLink,
      'media': media.toJson(),
    };
  }
}

class Media {
  final String type;
  final String url;

  Media({required this.type, required this.url});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
  }
}

class Program {
  final int id;
  final String name;
  final String type;
  final String day;
  final String month;
  final String image;
  final String video;
  final String file;

  Program({
    required this.id,
    required this.name,
    required this.type,
    required this.day,
    required this.month,
    required this.image,
    required this.video,
    required this.file,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      day: json['day'],
      month: json['month'],
      image: json['image'] ?? '',
      video: json['video'] ?? '',
      file: json['file'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'day': day,
      'month': month,
      'image': image,
      'video': video,
      'file': file,
    };
  }
}

class NewsFeed {
  final int id;
  final String title;
  final String? subtitle;
  final String content;
  final int likesCount;
  final int likesCountAbbreviate;
  final int commentsCount;
  final bool isLiked;
  final dynamic reaction;
  final String type;
  final NewsFeedMedia media;
  final List<dynamic> challengeMedia;
  final String date;
  final String time;
  final String utc;
  final bool ready;
  final String clientTag;
  final String clientTagColor;

  NewsFeed({
    required this.id,
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

  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    return NewsFeed(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      content: json['content'],
      likesCount: json['likes_count'],
      likesCountAbbreviate: json['likes_count_abbreviate'],
      commentsCount: json['comments_count'],
      isLiked: json['is_liked'],
      reaction: json['reaction'],
      type: json['type'],
      media: NewsFeedMedia.fromJson(json['media']),
      challengeMedia: List<dynamic>.from(json['challenge_media']),
      date: json['date'],
      time: json['time'],
      utc: json['utc'],
      ready: json['ready'],
      clientTag: json['client_tag'],
      clientTagColor: json['client_tag_color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'likes_count': likesCount,
      'likes_count_abbreviate': likesCountAbbreviate,
      'comments_count': commentsCount,
      'is_liked': isLiked,
      'reaction': reaction,
      'type': type,
      'media': media.toJson(),
      'challenge_media': challengeMedia,
      'date': date,
      'time': time,
      'utc': utc,
      'ready': ready,
      'client_tag': clientTag,
      'client_tag_color': clientTagColor,
    };
  }
}

class NewsFeedMedia {
  final String thumbnail;
  final String? url;
  final String length;
  final String seconds;

  NewsFeedMedia({
    required this.thumbnail,
    this.url,
    required this.length,
    required this.seconds,
  });

  factory NewsFeedMedia.fromJson(Map<String, dynamic> json) {
    return NewsFeedMedia(
      thumbnail: json['thumbnail'],
      url: json['url'],
      length: json['length'],
      seconds: json['seconds'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'url': url,
      'length': length,
      'seconds': seconds,
    };
  }
}

class SuccessStory {
  final int id;
  final String clientName;
  final String subtitle;
  final String content;
  final String image;
  final String date;

  SuccessStory({
    required this.id,
    required this.clientName,
    required this.subtitle,
    required this.content,
    required this.image,
    required this.date,
  });

  factory SuccessStory.fromJson(Map<String, dynamic> json) {
    return SuccessStory(
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

class Article {
  final int id;
  final String title;
  final String content;
  final String date;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date,
    };
  }
}