import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatsage_app/business/api_dto.dart';
import 'package:chatsage_app/config.dart';

class ApiConnector {
  static Future<AssistantResponse> createAssistant(
    AssistantRequest request,
  ) async {
    if (!Config.test) {
      if (request.files.isEmpty) {
        throw Exception('Files are required');
      }
      // Real call
      print('calling createAssistant');
      final response = await http.post(
        Uri.parse(Config.apiAssistantEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );
      print('response: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return AssistantResponse.fromJson(responseData);
      } else {
        throw Exception('Failed to generate response: ${response.statusCode}');
      }
    } else {
      // During tests, we return a mock response
      print('returning mock response');
      return AssistantResponse.fromJson({'assistantId': 'test'});
    }
  }

  static Future<AssistantResponse> updateAssistant(
    AssistantRequest request,
  ) async {
    if (!Config.test) {
      if (request.files.isEmpty) {
        throw Exception('Files are required');
      }
      // Real call
      print('calling updateAssistant');
      if (request.assistantId == null) {
        throw Exception('Assistant ID is required');
      }
      final response = await http.put(
        Uri.parse('${Config.apiAssistantEndpoint}/${request.assistantId}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return AssistantResponse.fromJson(responseData);
      } else {
        throw Exception('Failed to generate response: ${response.statusCode}');
      }
    } else {
      // During tests, we return a mock response
      print('returning mock response');
      return AssistantResponse.fromJson({'assistantId': 'test'});
    }
  }

  static Future<ChatResponse> chat(ChatRequest request) async {
    if (!Config.test) {
      if (request.query.isEmpty) {
        throw Exception('Query is required');
      }
      // Real call
      print('calling chat');
      final response = await http.post(
        Uri.parse('${Config.apiChatEndpoint}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      print('response: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return ChatResponse.fromJson(responseData);
      } else {
        throw Exception('Failed to generate response: ${response.statusCode}');
      }
    } else {
      // During tests, we return a mock response
      print('returning mock response');
      return ChatResponse.fromJson({'answer': 'Fake answer'});
    }
  }
}
