import 'package:flutter/material.dart';
import 'package:simple_chat_app/model/message_model.dart';
import 'package:simple_chat_app/service/ai_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final openAI = AIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO
          (0, 126, 160, 1),
        title: const Text('Chat OpenAI',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (_, i){
              final msg = _messages[i];
              return Container();
            },
          ))
        ],
      )
    );
  }
}
