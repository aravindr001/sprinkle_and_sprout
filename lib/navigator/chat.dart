import 'package:flutter/material.dart';
import 'package:sprinkle_and_sprout/screens/chatbot.dart';
import 'package:sprinkle_and_sprout/providers/chats_provider.dart';
import 'package:sprinkle_and_sprout/providers/models_provider.dart';
import 'package:provider/provider.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: ChatScreen(),
    );
  }
}
