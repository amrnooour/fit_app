class HomeModel {
  bool value;
  Data data;
  int code;

  HomeModel({
    required this.value,
    required this.data,
    required this.code,
  });

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
  List<Exam> exams;
  NewsFeed newsFeeds;
  List<SuccessStory> successStories;
  List<Article> articles;

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
    var slidersList = json['sliders'] as List;
    List<Slider> sliders = slidersList.map((i) => Slider.fromJson(i)).toList();

    var programsList = json['programs'] as List;
    List<Program> programs = programsList.map((i) => Program.fromJson(i)).toList();

    var examsList = json['exams'] as List;
    List<Exam> exams = examsList.map((i) => Exam.fromJson(i)).toList();

    var successStoriesList = json['success_stories'] as List;
    List<SuccessStory> successStories = successStoriesList.map((i) => SuccessStory.fromJson(i)).toList();

    var articlesList = json['articles'] as List;
    List<Article> articles = articlesList.map((i) => Article.fromJson(i)).toList();

    return Data(
      freeSubscriptionPeriod: json['free_subscription_period'],
      referrals: Referrals.fromJson(json['referrals']),
      sliders: sliders,
      programs: programs,
      exams: exams,
      newsFeeds: NewsFeed.fromJson(json['news_feeds']),
      successStories: successStories,
      articles: articles,
    );
  }
}

class Referrals {
  int count;
  int subscribed;

  Referrals({
    required this.count,
    required this.subscribed,
  });

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
      type: json['type'] ?? '',
      modelId: json['model_id'],
      externalLink: json['external_link'],
      media: Media.fromJson(json['media']),
    );
  }
}

class Media {
  String? type;
  String? url;

  Media({
    this.type,
    this.url,
  });

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

class Exam {
  int id;
  String name;
  String type;
  String day;
  String month;
  String image;
  String video;
  String file;

  Exam({
    required this.id,
    required this.name,
    required this.type,
    required this.day,
    required this.month,
    required this.image,
    required this.video,
    required this.file,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
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
  String? reaction;
  String type;
  Media media;
  List<dynamic> challengeMedia;
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
      media: Media.fromJson(json['media']),
      challengeMedia: json['challenge_media'],
      date: json['date'],
      time: json['time'],
      utc: json['utc'],
      ready: json['ready'],
      clientTag: json['client_tag'],
      clientTagColor: json['client_tag_color'],
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