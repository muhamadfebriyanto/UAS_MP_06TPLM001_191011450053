import 'package:dio/dio.dart';
import 'package:berita/model/berita_model.dart';

class BeritaRequest {
  Future<BeritaModel> getBerita() async {
    Response response = await Dio()
        .get('https://api-berita-indonesia.vercel.app/antara/terbaru');
    return BeritaModel.fromJson(response.data);
  }
}
