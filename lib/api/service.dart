import 'package:dio/dio.dart';
import '../model/contract_model.dart';
import '../model/insurance_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://private-7e14ff-testingapiaryio.apiary-mock.com'),
  );

  Future<List<Contract>> fetchContracts() async {
    final res = await _dio.get('/contracts/');
    final List list = res.data['contracts'];
    return list.map((e) => Contract.fromJson(e)).toList();
  }

  Future<List<Insurance>> fetchInsurances() async {
    final res = await _dio.get('/insurances/');
    final List list = res.data['orderList'];
    return list.map((e) => Insurance.fromJson(e)).toList();
  }
}
