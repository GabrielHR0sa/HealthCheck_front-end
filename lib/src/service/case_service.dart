import 'package:dio/dio.dart';
import 'package:health_check/src/dio_client.dart';
import 'package:health_check/src/model/case_register_dto.dart';
import 'package:health_check/src/model/case_search_request_dto.dart';

class CaseService {
  final Dio _dio = DioClient.dio;

  Future<Response> registerCase(CaseRegisterDTO caseDTO) async {
    try {
      final response = await _dio.post('/cases', data: caseDTO.toJson());
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Erro ao registrar caso');
    }
  }

  Future<Response> searchCases(CaseSearchRequestDTO searchDTO) async {
  try {
    final response = await _dio.request(
      '/cases/search',
      data: searchDTO.toJson(),
      options: Options(method: 'GET'),
    );
    return response;
  } on DioException catch (e) {
    throw Exception(e.response?.data['message'] ?? 'Erro ao buscar casos');
  }
}

}
