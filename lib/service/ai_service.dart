import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  final String API_KEY = "API";

  late final GenerativeModel model;

  AIService(){
    model = GenerativeModel(model: "gemini-2.5-flash", apiKey: API_KEY);
  }

  Future<String> generateMessage(String message) async{
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    return response.text ?? "No Response";
  }
}
