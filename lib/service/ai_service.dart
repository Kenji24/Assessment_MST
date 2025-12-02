import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  final String API_KEY = "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";

  Future<String> generateMessage(String message) async {
    final url = Uri.parse("https://api.openai.com/v1/chat/completions");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $API_KEY",
      },
      body: jsonEncode({
        "model": 'gpt-4o-mini',
        "message": message,
        "max token": 100,
      }),
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'].toString().trim();
    } else {
      throw Exception('failed to load OpenAI response: ${response.body}');
    }
  }
}
