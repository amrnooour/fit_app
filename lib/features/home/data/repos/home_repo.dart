import 'package:dartz/dartz.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/home/data/models/home_model.dart';

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
}
