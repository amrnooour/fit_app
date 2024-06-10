
class HomeModel {
  bool value;
  Data data;
  int code;

  HomeModel({required this.value, required this.data, required this.code});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      value: json['value'],
      data: Data.fromJson(json['data']),
      code: json['code'],
    );
  }
}

class Data {
  String freeSubscriptionPeriod;
  Referrals referrals;
  List<Slider> sliders;
  List<Program> programs;
  List<dynamic> exams; // Adjust type if necessary
  NewsFeed newsFeed;
  List<SuccessStory> successStories;
  List<Article> articles;

  Data({
    required this.freeSubscriptionPeriod,
    required this.referrals,
    required this.sliders,
    required this.programs,
    required this.exams,
    required this.newsFeed,
    required this.successStories,
    required this.articles,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var sliderList = json['sliders'] as List;
    var programList = json['programs'] as List;
    var examList = json['exams'] as List;
    var successStoryList = json['success_stories'] as List;
    var articleList = json['articles'] as List;

    return Data(
      freeSubscriptionPeriod: json['free_subscription_period'],
      referrals: Referrals.fromJson(json['referrals']),
      sliders: sliderList.map((i) => Slider.fromJson(i)).toList(),
      programs: programList.map((i) => Program.fromJson(i)).toList(),
      exams: examList, // Adjust if necessary
      newsFeed: NewsFeed.fromJson(json['news_feeds']),
      successStories: successStoryList.map((i) => SuccessStory.fromJson(i)).toList(),
      articles: articleList.map((i) => Article.fromJson(i)).toList(),
    );
  }
}

class Referrals {
  int count;
  int subscribed;

  Referrals({required this.count, required this.subscribed});

  factory Referrals.fromJson(Map<String, dynamic> json) {
    return Referrals(
      count: json['count'],
      subscribed: json['subscribed'],
    );
  }
}

class Slider {
  int id;
  String title;
  String buttonText;
  String name;
  String description;
  String type;
  int? modelId;
  String? externalLink;
  Media media;

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
}

class Media {
  String type;
  String url;

  Media({required this.type, required this.url});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'],
      url: json['url'],
    );
  }
}

class Program {
  int id;
  String name;
  String type;
  String day;
  String month;
  String image;
  String video;
  String file;

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
      image: json['image'],
      video: json['video'],
      file: json['file'],
    );
  }
}

class NewsFeed {
  int id;
  String title;
  String? subtitle;
  String content;
  int likesCount;
  int likesCountAbbreviate;
  int commentsCount;
  bool isLiked;
  String type;
  List<NewsFeedMedia> media;
  String date;
  String time;
  String utc;
  bool ready;
  String clientTag;
  String clientTagColor;

  NewsFeed({
    required this.id,
    required this.title,
    this.subtitle,
    required this.content,
    required this.likesCount,
    required this.likesCountAbbreviate,
    required this.commentsCount,
    required this.isLiked,
    required this.type,
    required this.media,
    required this.date,
    required this.time,
    required this.utc,
    required this.ready,
    required this.clientTag,
    required this.clientTagColor,
  });

  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    var mediaList = json['media'] as List;
    return NewsFeed(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      content: json['content'],
      likesCount: json['likes_count'],
      likesCountAbbreviate: json['likes_count_abbreviate'],
      commentsCount: json['comments_count'],
      isLiked: json['is_liked'],
      type: json['type'],
      media: mediaList.map((i) => NewsFeedMedia.fromJson(i)).toList(),
      date: json['date'],
      time: json['time'],
      utc: json['utc'],
      ready: json['ready'],
      clientTag: json['client_tag'],
      clientTagColor: json['client_tag_color'],
    );
  }
}

class NewsFeedMedia {
  String thumbnail;
  String url;
  String length;
  String seconds;

  NewsFeedMedia({
    required this.thumbnail,
    required this.url,
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
}

class SuccessStory {
  int id;
  String clientName;
  String subtitle;
  String content;
  String image;
  String date;

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
}

class Article {
  int id;
  String title;
  String content;
  String image;
  String date;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      date: json['date'],
    );
  }
}

