
import 'package:dio/dio.dart';
import 'package:health_check/src/dio_client.dart';
import 'package:health_check/src/model/agent_login_dto.dart';
import 'package:health_check/src/model/agent_register_dto.dart';
import 'package:health_check/src/model/agent_response_dto.dart';

class AgentService {
  final Dio _dio = DioClient.dio;

  Future<AgentResponseDTO> register(AgentRegisterDTO dto) async {
    try {
      final response = await _dio.post('/register', data: dto.toJson());
      return AgentResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Erro no registro');
    }
  }

  Future<AgentResponseDTO> login(AgentLoginDTO dto) async {
    try {
      final response = await _dio.post('/login', data: dto.toJson());
      return AgentResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Erro no login');
    }
  }
}
