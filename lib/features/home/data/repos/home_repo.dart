import 'package:dartz/dartz.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/home/data/models/articles_model.dart';
import 'package:fit_app/features/home/data/models/home_model.dart';
import 'package:fit_app/features/home/data/models/success_stories_model.dart';

class HomeRepo {
  final DioConsumer dioConsumer;
  HomeRepo({required this.dioConsumer});

  Future<Either<String, HomeModel>> getUser() async {
    try {
      final response = await dioConsumer.get(Constants.homeData,
          queryParameters: {
            "Accept": "application/json",
            "X-Tanant": "sst",
            "Accept-Language": "en"
          });
      final user = HomeModel.fromJson(response);
      return right(user);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, SuccessStoresModel>> getSuccessStores() async {
    try {
      final token = CacheHelper().getData(key: "token");
      final response = await dioConsumer.get(Constants.successStories,
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          });
      final data = SuccessStoresModel.fromJson(response);
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ArticlesModel>> getArticles() async {
    try {
      final token = CacheHelper().getData(key: "token");
      final response = await dioConsumer.get(Constants.articles, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      final data = ArticlesModel.fromJson(response);
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }
}
