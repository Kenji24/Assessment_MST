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
  final AI = AIService();

  void _sendMessage() async {
    final text = _controller.text;
    if(text.isEmpty) return;

    setState(() {
      _messages.add(Message(text, true));
    });
    _controller.clear();

    final reply = await AI.generateMessage(text);

    setState(() {
      _messages.add(Message(reply, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO
          (0, 126, 160, 1),
        title: const Text('Chat AI',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (_, i){
              final msg = _messages[i];
              return Container(
                alignment: msg.status ? Alignment.centerRight : Alignment.centerLeft,
                padding: EdgeInsets.all(8),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: msg.status ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(msg.text, style: TextStyle(
                      color: msg.status ? Colors.white : Colors.black)
                  ),
                ),
              );
            },
          )),
          Row(
            children: [
              Expanded(child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Type a Message...",
                    contentPadding: EdgeInsets.all(12)
                ),
              )),
              IconButton(onPressed: _sendMessage, icon: Icon(Icons.send))
            ],
          )
        ],
      )
    );
  }
}
