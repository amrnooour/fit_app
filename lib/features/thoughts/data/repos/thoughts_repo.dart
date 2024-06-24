import 'package:dartz/dartz.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/thoughts/data/models/thoughts_model.dart';

class ThoughtsRepo {
  DioConsumer dioConsumer;
  ThoughtsRepo(this.dioConsumer);

  Future<Either<String, ThoughtsModel>> getMedia() async {
    try {
      final response = await dioConsumer.get(Constants.getMedia, headers: {
        "x-tenant": "sst",
        "Accept": "application/json",
        "Authorization": "Bearer 6376|6sibOdL2ijrshLhraJAizd5rpG1izBbID6LODoAr"
      });
      final media = ThoughtsModel.fromJson(response);
      return right(media);
    } catch (e) {
      return left(e.toString());
    }
  }
}
