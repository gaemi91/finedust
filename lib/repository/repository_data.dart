import 'package:dio/dio.dart';
import 'package:finedust_practice01/const/data.dart';
import 'package:finedust_practice01/model/model_fetch_data.dart';

class RepositoryData {
  static Future<List<ModelFetchData>> fetchData() async {
    final resp = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
        'numOfRows': 30,
        'pageNo': 1,
        'itemCode': 'PM10',
        'dataGubun': 'Hour',
        'searchCondition': 'WEEK',
      },
    );

    return resp.data['response']['body']['items'].map<ModelFetchData>((e) => ModelFetchData.fromJson(json: e)).toList();
  }
}
